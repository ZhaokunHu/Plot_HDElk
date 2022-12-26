#Plot_yEd

to use this,you need:
--SpinalHDL environment
--yEd Graph Editor

when you finish a SpinalHDL coding,add the following code to main

    val rtl = SpinalVerilog(new _)
    val drawyed = new Plot_yEd(rtl.toplevel)
    drawyed.begindraw
    
these code will create a file names _.graphml,use yEd Graph Editor to open it
don't forget to choose an auto layout way 
