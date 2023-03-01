package Plot_All

import NewPlot.Plot_ELK
import Plot_GroupIO.PlotGroupedIO
import Simple_ELK.{Plot_Inner_Module, Plot_Simple_ELK}
import analyzer.ModuleAnalyzer
import spinal.core.{Component, SpinalReport}

import java.io.{File, FileWriter}

class Plot_All(rtl: SpinalReport[Component]) {
    def plot_All: Unit ={
      val module=rtl.toplevel
      val fileName = rtl.toplevelName + "_All.html"
      val file = new File(fileName)
      val pw = new FileWriter(file)
      pw.write("<!DOCTYPE html>\n<html>\n<head>\n    <meta charset=\"UTF-8\" />\n    <title>rtl连接图</title>\n</head>\n")
      pw.write("<script src=\"/js/elk.bundled.js\"></script>\n<script src=\"/js/svg.min.js\"></script>\n<script src=\"/js/hdelk.js\"></script>\n\n<h4>选择你想看的图像</h4>\n<a href=\"#Toplevel_Simple\"><button>Toplevel_Simple</button></a>&nbsp;\n<a href=\"#Toplevel_All\"><button>Toplevel_All</button></a>&nbsp;\n<a href=\"#Toplevel_GroupedIO\"><button>Toplevel_GroupedIO</button></a>&nbsp;\n")
      val moduleanalyze = new ModuleAnalyzer(module)
      val allInnerCells = moduleanalyze.getCells(_.getName() != "toplevel")
      for (cell <- allInnerCells) {
        pw.write("<a href=\"#"+cell.getName()+"\"><button>"+cell.getName()+"</button></a>&nbsp;\n")
      }
      pw.write("<br><br><br><br>")
      pw.close()
      new Plot_Simple_ELK(rtl).begindraw
      new Plot_ELK(rtl).begindraw
      new PlotGroupedIO(rtl).begindraw
      new Plot_Inner_Module(rtl).begindraww
      val pa = new FileWriter(file, true)
      pa.write("</html>")
      pa.close()
    }
}
