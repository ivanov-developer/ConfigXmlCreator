   M S B A M L   `   `   `  ����   XmlConfigCreator!    XmlConfigCreator.MainWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962ac _MaterialDesignThemes.MahApps, Version=0.3.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a4i1+http://schemas.microsoft.com/xaml/behaviors    � Title$a  [Создание XML файла для импорта пакета конфигураций��$	��450��$	��800��   MaterialDesignPaper#���     MaterialDesignFont#���   � Cursor$  �� � WindowStartupLocation$ CenterScreen=� � 	Resources  �� MergedDictionaries �� Source��  �� $f `pack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Button.xaml?��� $g apack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Shadows.xaml?��� $l fpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.ToggleButton.xaml?�%    .��)  #MaterialDesignThemes.Wpf.DialogHost     DialogTheme$ Inherit=�   
Identifier$ 
RootDialog��   SnackbarMessageQueue �� 	 �� ElementName$	 MainSnackbar��
 �� Path$
 MessageQueue�.��� $  �� � ColumnDefinitions �� $
��auto ��� $��* � � RowDefinitions �� $��* ��� $
��auto �.+��� -   $��StackPanelEveryDataConfig�� �� Orientation$ Vertical=�.+��� -   $ ��StackPanelNamePacketConfig��$ 
Horizontal=�$��1q�.+��� $��Имя пакета:��$��15(�$��0q�$��Bottom=�$  ���� -   $��TextBoxNameConfig��$	��200��$��Medium"�$��15(�$��Bottom=�$��Center=�$��3q�$  ������ *
NameConfig+ �� UpdateSourceTrigger$ PropertyChanged=� �� Mode$ TwoWay=��� $6��0Файлы пакетов для импорта:��$��15(�$��Bottom=�$��1q��� $  ������ *
PlmFiles+$ TwoWay=����� .R��� $��14(�$��Medium"�$��3q����� $

 Name�$ TwoWay=�$ PropertyChanged=� d� 	IsChecked �� $
 IsImport�$ TwoWay=�$ PropertyChanged=��� $ 
Horizontal=�$��2q�.+��� -   $��ButtonLoadPlmPackets��$#��Загрузить файлы��$	��150��$��5q�$
��Left=�$
 Hand��*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Click��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command �� *GetPlmFilesCommand+�� -   $��ButtonCreateNode��$��Создать узел��$	��150��$��5q�$
 Hand��$��Right=�   $ Click��.    �� *AddNodeCommand+�� -   $��StackPanelPreview��$ Vertical=�$��2q�$��1��$��0��$  ��.+��� $6��0Предварительный просмотр:��$��Bottom=�$��Center=�$��15(�$  ���� $	��300��$	��300��$��1q�$��13(� �� 
IsReadOnly . ���� $
 XML.XmlContent�$ PropertyChanged=�$ TwoWay=��� $ 
Horizontal=�$��2q�$��Center=�$  ��.+��� -   $��ButtonSaveXml��$��Сохранить XML��$��2q�$	��150��$
 Hand��   $ Click��.    �� *SaveXMLCommand+�� $��Сбросить все��$��2q�$	��150��
���<��$
 Hand��   $ Click��.    �� *Clean+