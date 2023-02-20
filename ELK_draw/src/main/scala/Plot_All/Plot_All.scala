package Plot_All

import NewPlot.Plot_ELK
import Simple_ELK.{Plot_Inner_Module, Plot_Simple_ELK}
import spinal.core.{Component, SpinalReport}

import java.io.{File, FileWriter}

class Plot_All(rtl: SpinalReport[Component]) {
    def plot_All: Unit ={
      val fileName = rtl.toplevelName + "_All.html"
      val file = new File(fileName)
      val pw = new FileWriter(file)
      pw.write("<script src=\"/js/elk.bundled.js\"></script>\n<script src=\"/js/svg.min.js\"></script>\n<script src=\"/js/hdelk.js\"></script>\n\n")
      pw.close()
      new Plot_Simple_ELK(rtl).begindraw
      new Plot_ELK(rtl).begindraw
      new Plot_Inner_Module(rtl).begindraww
    }
}
