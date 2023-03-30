#Plot_Elk

All the useful codes are stored in package Elk_draw,and now this project is not finished yet.
to use this,you need:
--SpinalHDL environment
--add the codes in Elk_draw to your project
when you finish a SpinalHDL coding,add the following code to main(_ represent Component)

     val drawELK = new Plot_All(SpinalVerilog(new _))
     drawELK.plot_All
    
these code will create a file names _.html,use browser to open it.

