   M S B A M L   `   `   `  ����  XmlConfigCreator!    XmlConfigCreator.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962ac _MaterialDesignThemes.MahApps, Version=0.3.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5   	   _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a4i1+http://schemas.microsoft.com/xaml/behaviors  5   	     � Title$a  [Создание XML файла для импорта пакета конфигураций��5	   	   $	��450��5
   	   $	��800��6      MaterialDesignPaper#���   5   	     MaterialDesignFont#���  5   	    � Cursor$  ��6;    � WindowStartupLocation$ CenterScreen=�5   	    � 	Resources 5       �� MergedDictionaries �� Source�� 5   
    5      �� 5      $f `pack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Button.xaml?�6%   �� 5      $g apack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Shadows.xaml?�6%   �� 5      $l fpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.ToggleButton.xaml?�6%   %    5      .��5      )  #MaterialDesignThemes.Wpf.DialogHost     DialogTheme$ Inherit=�6       
Identifier$ 
RootDialog��5         SnackbarMessageQueue 5      �� 	 �� ElementName$	 MainSnackbar��
 �� Path$
 MessageQueue�.��5   
   � $  ��6    � ColumnDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5       $��* �6   �� 5!      $
��auto �6   .+�5#      �� -   5        $��StackPanelEveryDataConfig��5#       �� Orientation$ Vertical=�6:   .+�5$      �� -   5        $ ��StackPanelNamePacketConfig��5$      $ 
Horizontal=�6?   $��1q�6X   .+�5%      �� $��Имя пакета:��6   $��15(�62   $��0q�6@   $��Bottom=�6K   $  ��6f   �� 5&      -   5        $��TextBoxNameConfig��5&      $	��200��67   $��Medium"�6C   $��15(�6W   $��Bottom=�5'      $��Center=�6@   $��3q�6[   $  ��6f   ��5(      �� *
NameConfig+ �� UpdateSourceTrigger$ PropertyChanged=� �� Mode$ TwoWay=�5)      �� 5*      $6��0Файлы пакетов для импорта:��6   $��15(�69   $��Bottom=�6G   $��1q�6b   �� 5+      $  ��6M   ��6   �� *
PlmFiles+$ TwoWay=���5,      �� 5-      .R�5.      �� $��14(�5/   '   $��Medium"�65   $��3q�6I   ��5.   '   �� $

 Name�$ TwoWay=�$ PropertyChanged=� d� 	IsChecked 50   '   �� $
 IsImport�$ TwoWay=�$ PropertyChanged=�51      53      �� 54      $ 
Horizontal=�6   $��2q�66   .+�55      �� -   5        $��ButtonLoadPlmPackets��55      $#��Загрузить файлы��69   $	��150��6S   $��5q�56      $
��Left=�6(   $
 Hand��6C   *  $Microsoft.Xaml.Behaviors.Interaction   Triggers 57      +  %Microsoft.Xaml.Behaviors.EventTrigger  58         	EventName$ Click��6.   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 59   "   2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 69   �� *GetPlmFilesCommand+5:   #   5;      5=      �� 5>      -   5        $��ButtonCreateNode��5>      $��Создать узел��65   $	��150��6L   $��5q�5?      $
 Hand��6(   $��Right=�66    5@        5A      $ Click��6.   . 5B   "      69   �� *AddNodeCommand+5C   #   5D      5F      5G      5I      �� 5J      -   5        $��StackPanelPreview��5J      $ Vertical=�62   $��2q�6I   $��1��6T   $��0��6d   $  ��6q   .+�5K      �� $6��0Предварительный просмотр:��6   $��Bottom=�6<   $��Center=�6W   $��15(�6t   $  ��6�   �� 5L      $	��300��6   $	��300��6&   $��1q�63   $��13(�6G    �� 
IsReadOnly . ��5M      �� $
 XML.XmlContent�$ PropertyChanged=�$ TwoWay=�6s   �� 5N      $ 
Horizontal=�6   $��2q�66   $��Center=�6A   $  ��6^   .+�5O      �� -   5        $��ButtonSaveXml��5O      $��Сохранить XML��62   $��2q�6J   $	��150��6U   $
 Hand��6a    5P        5Q      $ Click��6*   . 5R         65   �� *SaveXMLCommand+5S      5T      5V      �� 5W      $��Сбросить все��6   $��2q�64   $	��150��6?   
���<��$
 Hand��6`    5X        5Y      $ Click��6.   . 5Z   "      69   �� *Clean+5[   #   5\      5^      5_      5`      5a      5b      5c      