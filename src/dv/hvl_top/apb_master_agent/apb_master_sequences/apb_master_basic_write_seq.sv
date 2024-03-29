`ifndef APB_MASTER_BASIC_WRITE_SEQ_INCLUDED_
`define APB_MASTER_BASIC_WRITE_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Extends the apb_master_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class apb_master_basic_write_seq extends apb_master_base_seq;
  `uvm_object_utils(apb_master_basic_write_seq)

  string clkPrescale_reg = "CLOCK_PRESCALE_REG_SEQ";
  string control_reg     = "CONTROL_REG_SEQ";
  string tx_reg          = "TX_REG_SEQ";
  string rx_reg          = "RX_REG_SEQ";
  string command_reg     = "COMMAND_REG_SEQ";
  string status_reg      = "STATUS_REG_SEQ";
  
  bit[7:0] transmitData = 8'hAC;

  extern function new(string name ="apb_master_basic_write_seq");
  extern task body();
  endclass : apb_master_basic_write_seq

function apb_master_basic_write_seq::new(string name="apb_master_basic_write_seq");
  super.new(name);
endfunction : new

task apb_master_basic_write_seq::body();
  super.body();
  req=apb_master_tx::type_id::create("req");
  req.apb_master_agent_cfg_h = p_sequencer.apb_master_agent_cfg_h;


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_5000;
                            req.pwdata == 32'h0000_0001;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : CPR
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(clkPrescale_reg,$sformatf("clkPrescale_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);

  begin
    bit[6:0] targetAddress = 7'h68;
    bit operation = 0; // 0 means write
    bit [31:0] data;

    data = {24'h0,targetAddress, operation};  
    //D0 for write 
    //D1 for read

    start_item(req);
    if(!req.randomize() with {req.pselx == SLAVE_0;
                              req.paddr == 32'h1A10_5008;
                              req.pwdata == data;  
                              req.transfer_size == BIT_32;
                              req.cont_write_read == 0;
                              req.pwrite == WRITE;}) begin : TXREG
      `uvm_fatal("APB","Rand failed");
    end
    `uvm_info(tx_reg,$sformatf("tx_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
    finish_item(req);
  end


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_5004;
                            req.pwdata == 32'h0000_00C0;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : CTRL
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(control_reg,$sformatf("control_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);

  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_5010;
                            req.pwdata == 32'h0000_0090;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : COMMAND
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(command_reg,$sformatf("command_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);


do 
 begin
 start_item(req);
 if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_5014;
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == READ;}) begin : STATUS_DATA
 `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(status_reg,$sformatf("Address status_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
 finish_item(req);
 end
 while(req.prdata[1]==1); 
 
 if(req.prdata[7]) begin
  `uvm_error(status_reg, $sformatf("Address RxACK = %0d", req.prdata[7]))
 end

 // MSHA: start_item(req);
 // MSHA:  if(!req.randomize() with {req.pselx == SLAVE_0;
 // MSHA:                            req.paddr == 32'h1A10_5000;
 // MSHA:                            req.pwdata == 32'h0000_0001;  
 // MSHA:                            req.transfer_size == BIT_32;
 // MSHA:                            req.cont_write_read == 0;
 // MSHA:                            req.pwrite == WRITE;}) begin : CPR_W
 // MSHA:    `uvm_fatal("APB","Rand failed");
 // MSHA:  end
 // MSHA:  `uvm_info(clkPrescale_reg,$sformatf("clkPrescale_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
 // MSHA:  finish_item(req);

  begin
    bit[7:0] writeData = transmitData;
    bit [31:0] data;

    data = {24'h0,writeData};  

    start_item(req);
    if(!req.randomize() with {req.pselx == SLAVE_0;
                              req.paddr == 32'h1A10_5008;
                              req.pwdata == data;  
                              req.transfer_size == BIT_32;
                              req.cont_write_read == 0;
                              req.pwrite == WRITE;}) begin : TXREG_W
      `uvm_fatal("APB","Rand failed");
    end
    `uvm_info(tx_reg,$sformatf("tx_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
    finish_item(req);
  end


  // MSHA: start_item(req);
  // MSHA: if(!req.randomize() with {req.pselx == SLAVE_0;
  // MSHA:                           req.paddr == 32'h1A10_5004;
  // MSHA:                           req.pwdata == 32'h0000_00C0;  
  // MSHA:                           req.transfer_size == BIT_32;
  // MSHA:                           req.cont_write_read == 0;
  // MSHA:                           req.pwrite == WRITE;}) begin : CTRL_W
  // MSHA:   `uvm_fatal("APB","Rand failed");
  // MSHA: end
  // MSHA: `uvm_info(control_reg,$sformatf("control_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  // MSHA: finish_item(req);


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_5010;
                            req.pwdata == 32'h0000_0050;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : COMMAND_DATA
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(command_reg,$sformatf("command_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);

  do 
   begin
   start_item(req);
   if(!req.randomize() with {req.pselx == SLAVE_0;
                              req.paddr == 32'h1A10_5014;
                              req.transfer_size == BIT_32;
                              req.cont_write_read == 0;
                              req.pwrite == READ;}) begin : STATUS_ADDRESS
   `uvm_fatal("APB","Rand failed");
    end
    `uvm_info(status_reg,$sformatf("Data status_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
   finish_item(req);
   end
 while(req.prdata[1]==1); 
 
 if(req.prdata[7]) begin
  `uvm_error(status_reg, $sformatf("Data RxACK = %0d", req.prdata[7]))
 end


endtask : body

`endif
