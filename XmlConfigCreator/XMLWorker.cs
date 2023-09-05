using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Linq;

namespace XmlConfigCreator
{
    internal class XMLWorker : INotifyPropertyChanged
    {
        public XDocument XmlDoc { get; set; }
        private string xmlContent;
        public string XmlContent
        {
            get { return xmlContent; }
            set
            {
                if (xmlContent != value)
                {
                    xmlContent = value;
                    OnPropertyChanged(nameof(XmlContent));
                }
            }
        }
        private void CreateXml()
        {
            XDocument XmlDoc = new XDocument();
            XElement rootElement = new XElement("configs");
            XmlDoc.Add(rootElement);            
            XmlContent = XmlDoc.ToString();
        }
        public void AddNewConfig(ConfigXelement configXelement)
        {            
            XmlDoc = LoadTextReader();
            bool existSameName = CheckSameName(configXelement);
            if (existSameName == false)
            {
                SendChoosedConfigsToXmlDoc(configXelement);
            }
        }
        private bool CheckSameName(ConfigXelement configXelement)
        {
            bool sameName = false;            
            XElement foundSameName = XmlDoc.Elements("configs").Elements("config").
                                    Elements("name").Where(x => x.Value == configXelement.NameConfig).FirstOrDefault();
            if (foundSameName != null)
            {
                sameName= true;
                System.Windows.Forms.MessageBox.Show("Конфигурация с указанным именем пакета уже существует.","Действие отменено",MessageBoxButtons.OK,MessageBoxIcon.Information);
            }
            return sameName;
        }
        private void SendChoosedConfigsToXmlDoc(ConfigXelement configXelement)
        {
            List<PLMFile> PlmFilesForImport = configXelement.PLMFiles.Where(x => x.IsImport == true).ToList();
            if (PlmFilesForImport.Count > 0)
            {
                XElement files = GetXelementFiles(PlmFilesForImport);
                if (files.Elements("filename").Count() > 0)
                {
                    CreateConfigXelement(configXelement, files);
                }                
            }
            else
            {
                System.Windows.Forms.MessageBox.Show("Выберите хотя бы одну конфигурацию.", "Действие отменено", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
        private XElement GetXelementFiles(List<PLMFile> plmFilesForImport)
        {
            XElement files = new XElement("files");
            foreach (PLMFile plmFile in plmFilesForImport)
            {
                XElement fileName = new XElement("filename");
                bool existSameFileName = CheckSameFileName(plmFile.Name);
                if (existSameFileName == false)
                {
                    fileName.Value = plmFile.Name;
                    files.Add(fileName);
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show($"{plmFile.Name} уже присутствует в другом элементе","Конфигурация не будет добавлена в данный узел", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                }
            }
            return files;
        }
        private bool CheckSameFileName(string fileName)
        {
            bool sameName = false;
            XElement foundSameFileName = XmlDoc.Elements("configs").Elements("config").Elements("files").Elements("filename").
                                                Where(x => x.Value == fileName).FirstOrDefault();
            if (foundSameFileName != null)
            {
                sameName= true;
            }
            return sameName;
        }
        private void CreateConfigXelement(ConfigXelement configXelement, XElement files)
        {
            XElement root = XmlDoc.Root;
            XElement config = new XElement("config");
            XElement name = new XElement("name");
            name.Value = configXelement.NameConfig;
            config.Add(name);
            config.Add(files);
            root.Add(config);
            XmlContent = XmlDoc.ToString();
        }        
        public void SaveXml()
        {
            try
            {
                System.Windows.Forms.SaveFileDialog saveFileDialog = new System.Windows.Forms.SaveFileDialog();
                saveFileDialog.Filter = "XML files (*.xml)|*.xml";
                DialogResult dialogResult = saveFileDialog.ShowDialog();
                if (dialogResult == DialogResult.OK)
                {
                    XmlDoc = LoadTextReader();
                    XmlDoc.Save(saveFileDialog.FileName);
                }
            }
            catch (XmlException ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }
            
        }
        private XDocument LoadTextReader()
        {
            TextReader textReader = new StringReader(XmlContent);
            XmlDoc = XDocument.Load(textReader);
            return XmlDoc;
        }
        public XMLWorker()
        {
            CreateXml();
        }
        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}
