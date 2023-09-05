using System.Collections.ObjectModel;
using System.IO;
using System.Windows.Forms;

namespace XmlConfigCreator
{
    internal class PlmPackages
    {
        public ObservableCollection<PLMFile> GetPackages()
        {
            ObservableCollection <PLMFile> PLMFiles= new ObservableCollection<PLMFile>();
            System.Windows.Forms.OpenFileDialog openFileDialog = new System.Windows.Forms.OpenFileDialog()
            {
                Filter = "Configuration packages (*.pmszcfg)|*.pmszcfg",
                Multiselect = true,
                Title = "Выберите конфигурации для импорта"
            };
            DialogResult dialogResult= openFileDialog.ShowDialog();
            if (dialogResult == DialogResult.OK)
            {
                foreach (string pathFile in openFileDialog.FileNames)
                {
                    string fileName = Path.GetFileName(pathFile);
                    PLMFile plmFile = new PLMFile();
                    plmFile.Name = fileName;
                    plmFile.IsImport = false;
                    PLMFiles.Add(plmFile);
                }
            }
            return PLMFiles;
        }
        public PlmPackages() 
        {

        }
    }
}
