using GalaSoft.MvvmLight.Command;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows;

namespace XmlConfigCreator
{
    internal class PLMConfigurationViewModel : INotifyPropertyChanged
    {
        private string nameConfig;
        public string NameConfig
        {
            get { return nameConfig; }
            set
            {
                if (nameConfig != value)
                {
                    nameConfig = value;
                    OnPropertyChanged(nameof(NameConfig));
                }
            }
        }
        private ObservableCollection<PLMFile> plmFiles;
        public ObservableCollection<PLMFile> PlmFiles
        {
            get { return plmFiles; }
            set
            {
                if (plmFiles != value)
                {
                    plmFiles = value;
                    OnPropertyChanged(nameof(PlmFiles));
                }
            }
        }
        private XMLWorker xml;
        public XMLWorker XML
        {
            get { return xml; }
            set
            {
                if (xml != value)
                {
                    xml = value;
                    OnPropertyChanged(nameof(XML));
                }
            }
        }
        private void CleanEverything()
        {
            var dialog = MessageBox.Show("Вы действительно хотите сбросить все?", "Сброс данных", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (dialog == MessageBoxResult.Yes)
            {
                NameConfig = null;
                XML = new XMLWorker();
                PlmFiles = null;
            }
        }
        private void GetPlmFiles()
        {
           PlmPackages plmPackages = new PlmPackages();
           PlmFiles = plmPackages.GetPackages();
        }
        private void AddNode()
        {
            if (!string.IsNullOrEmpty(NameConfig))
            {
                ConfigXelement configXelement = new ConfigXelement();
                if (configXelement.ValidateName(NameConfig) == true)
                {
                    NameConfig = configXelement.CheckSpaces(NameConfig);
                    configXelement.NameConfig = NameConfig;
                    configXelement.PLMFiles = PlmFiles;
                    XML.AddNewConfig(configXelement);
                }                
            }
            else
            {
                MessageBox.Show("Укажите имя конфигурации", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }        
        private void SaveXml()
        {
            XML.SaveXml();
        }
        private RelayCommand getPlmFiles;
        public RelayCommand GetPlmFilesCommand
        {
            get { return getPlmFiles ?? (new RelayCommand(GetPlmFiles)); }
        }
        private RelayCommand addNodeCommand;
        public RelayCommand AddNodeCommand
        {
            get { return addNodeCommand ?? (new RelayCommand(AddNode)); }
        }
        private RelayCommand saveXmlCommand;
        public RelayCommand SaveXMLCommand
        {
            get { return getPlmFiles ?? (new RelayCommand(SaveXml)); }
        }
        private RelayCommand clean;
        public RelayCommand Clean
        {
            get { return getPlmFiles ?? (new RelayCommand(CleanEverything)); }
        }
        public PLMConfigurationViewModel()
        {
            XML = new XMLWorker();
        }
        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}
