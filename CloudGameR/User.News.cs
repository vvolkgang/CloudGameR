using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Drawing;

namespace CloudGameR
{
    public partial class User : Window
    {
        private void LoadNews(int dayOffset)
        {
            try
            {
                var jogos = from j in CGameR.Jogos
                            where j.Data_Lancamento >= (DateTime.Today - new TimeSpan(dayOffset, 0, 0, 0))
                            select j;

                foreach (Jogo jogo in jogos.OrderByDescending(j => j.Data_Lancamento))
                {
                    this.NewsStackPanel.Children.Add(
                        new GameRow()
                        {
                            GameName = jogo.Nome,
                            GameGenre = jogo.Genero.Genero1,
                            GamePicture = jogo.Capa_Endereco,
                            GamePrice = (float)jogo.Preco_Base,
                            GameReleaseDate = jogo.Data_Lancamento,
                            GameEditor = jogo.Editora.Nome,
                            GameCreator = jogo.Criadora.Nome
                        });
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), Title + " - Loading News list.", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}