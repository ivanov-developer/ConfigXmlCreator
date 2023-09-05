using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Forms;

namespace XmlConfigCreator
{
    internal class ConfigXelement
    {
        public string NameConfig { get; set; }
        public ObservableCollection <PLMFile> PLMFiles { get; set; }
        public bool ValidateName(string nameConfig)
        {
            bool validate = true;
            char[] wrongCharacters = { '&', '<', '>', '"', '\'' };
            for (int i = 0; i < wrongCharacters.Length; i++)
            {
                if (nameConfig.Contains(wrongCharacters[i]))
                {
                    validate= false;
                    MessageBox.Show($"В {nameConfig} присутствует не верный символ. Исправьте.", "Неверный символ", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    break;
                }
            }
            return validate;
        }
        public string CheckSpaces(string nameConfig)
        {
            nameConfig = nameConfig.TrimStart(' ');
            nameConfig = nameConfig.TrimEnd(' ');
            return nameConfig;
        }
        public ConfigXelement()
        {

        }
    }
}
