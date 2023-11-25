using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial2MasterPage
{
    public partial class Form2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            llenarTabla();
        }

        public void llenarTabla()
        {
            //Cargar grilla de un grid view con los files
            string path = $"{Server.MapPath(".")}/nombreCompleto";
            if (Directory.Exists(path))
            {
                string[] files = Directory.GetFiles(path);
                //Creamos una clase llamada archivo
                List<Archivo> fileList = new List<Archivo>();
                foreach (string file in files)
                {
                    var fileNew = new Archivo(Path.GetFileName(file), file);
                    fileList.Add(fileNew);
                }
                GridView1.DataSource = fileList;
                GridView1.DataBind();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string path = $"{Server.MapPath(".")}/nombreCompleto";
            string resultado = string.Empty;

            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            foreach (HttpPostedFile archivo in FileUpload1.PostedFiles)
            {
                if (archivo.ContentLength > 1000)
                {
                    resultado += $"El archivo {archivo.FileName} supera los 100 bits";
                }
                else
                {
                    if (File.Exists($"{path}/{archivo.FileName}"))
                    {
                        resultado += $"El archivo {archivo.FileName} ya existe - ";
                    }
                    else
                    {
                        FileUpload1.SaveAs($"{path}/{archivo.FileName}");
                    }
                }
            }

            Label1.Text = resultado;
            llenarTabla();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Descargar")
            {
                GridViewRow registro = GridView1.Rows[Convert.ToInt32(e.CommandArgument)];
                string filePath = registro.Cells[2].Text;



                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.TransmitFile(filePath);
                Response.End();
            }
        }
    }
}