`ifndef APB_MASTER_BASIC_TRANSACTION_SEQ_INCLUDED_
`define APB_MASTER_BASIC_TRANSACTION_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Extends the apb_master_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class apb_master_basic_transaction_seq extends apb_master_base_seq;
  `uvm_object_utils(apb_master_basic_transaction_seq)

  string clkPrescale_reg = "CLOCK_PRESCALE_REG_SEQ";
  string control_reg     = "CONTROL_REG_SEQ";
  string tx_reg          = "TX_REG_SEQ";
  string rx_reg          = "RX_REG_SEQ";
  string command_reg     = "COMMAND_REG_SEQ";
  string status_reg      = "STATUS_REG_SEQ";
  
  extern function new(string name ="apb_master_basic_transaction_seq");
  extern task body();
  endclass : apb_master_basic_transaction_seq

function apb_master_basic_transaction_seq::new(string name="apb_master_basic_transaction_seq");
  super.new(name);
endfunction : new

task apb_master_basic_transaction_seq::body();
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
                            req.paddr == 32'h1A10_5091;
                            req.pwdata == 32'h0000_00D0;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : COMMAND
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(command_reg,$sformatf("command_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);




endtask : body

`endif
