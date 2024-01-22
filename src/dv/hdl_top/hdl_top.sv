`ifndef HDL_TOP_INCLUDED_
`define HDL_TOP_INCLUDED_

//--------------------------------------------------------------------------------------------
// Module      : HDL Top
// Description : It has apb_master_agent_bfm and spi_slave agent bfm.
//--------------------------------------------------------------------------------------------
module hdl_top;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  //import apb_global_pkg::*;
  //-------------------------------------------------------
  // Clock Reset Initialization
  //-------------------------------------------------------
  //bit clk;
  //bit rst;

  wire I3C_SCL;
  wire I3C_SDA;

 // Pullup for I3C interface
 pullup p1 (I3C_SCL);
 pullup p2 (I3C_SDA);

  //-------------------------------------------------------
  // Display statement for hdl_top
  //-------------------------------------------------------
  initial begin
    `uvm_info("UVM_INFO","hdl_top",UVM_LOW);
  end

  //Variable : pclk
  //Declaration of system clock
  bit pclk;

  //Variable : preset_n
  //Declaration of system reset
  bit preset_n;

  logic interrupt;

  //-------------------------------------------------------
  //Generation of system clock at frequency rate of 20ns
  //-------------------------------------------------------
  initial begin
    pclk = 1'b0;
    forever #10 pclk =!pclk;
  end

  //-------------------------------------------------------
  //Generation of system preset_n
  //system reset can be asserted asynchronously
  //system reset de-assertion is synchronous.
  //-------------------------------------------------------
  initial begin
    preset_n = 1'b1;
    
    #15 preset_n = 1'b0;

    repeat(1) begin
      @(posedge pclk);
    end
    preset_n = 1'b1;
  end

  //-------------------------------------------------------
  // apb Interface Instantiation
  //-------------------------------------------------------
  apb_if apb_intf(pclk,preset_n);

  //-------------------------------------------------------
  // apb Master BFM Agent Instantiation
  //-------------------------------------------------------
  apb_master_agent_bfm apb_master_agent_bfm_h(apb_intf); 

  //-------------------------------------------------------
  // I2C Master/Controller DUT Instantiation
  //-------------------------------------------------------
  apb_i2c DUT
  (
       .HCLK(apb_intf.pclk),
       .HRESETn(apb_intf.preset_n),
       .PADDR(apb_intf.paddr),
       .PWDATA(apb_intf.pwdata),
       .PWRITE(apb_intf.pwrite),
       .PSEL(apb_intf.pselx),
       .PENABLE(apb_intf.penable),
       .PRDATA(apb_intf.prdata),
       .PREADY(apb_intf.pready),
       .PSLVERR(apb_intf.pslverr),
  
       .interrupt_o(interrupt),
  
       .scl_pad_i(intf_controller.scl_i),
       .scl_pad_o(intf_controller.scl_o),
       .scl_padoen_o(intf_controller.scl_oen),
       .sda_pad_i(intf_controller.sda_i),
       .sda_pad_o(intf_controller.sda_o),
       .sda_padoen_o(intf_controller.sda_oen)

  );

 i3c_if intf_controller(.pclk(pclk),
                        .areset(preset_n),
                        .SCL(I3C_SCL),
                        .SDA(I3C_SDA));

  //-------------------------------------------------------
  // I3C Target Interface Instantiation
  //-------------------------------------------------------
  i3c_if intf_target(.pclk(pclk),
                    .areset(preset_n),
                    .SCL(I3C_SCL),
                    .SDA(I3C_SDA));

  //-------------------------------------------------------
  // I3C target BFM Agent Instantiation
  //-------------------------------------------------------
  i3c_target_agent_bfm i3c_target_agent_bfm_h(intf_target);

endmodule : hdl_top

`endif
