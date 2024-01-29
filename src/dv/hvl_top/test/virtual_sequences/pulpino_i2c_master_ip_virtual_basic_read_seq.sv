`ifndef PULPINO_I2C_MASTER_IP_VIRTUAL_BASIC_READ_SEQ_INCLUDED_
`define PULPINO_I2C_MASTER_IP_VIRTUAL_BASIC_READ_SEQ_INCLUDED_

class pulpino_i2c_master_ip_virtual_basic_read_seq extends pulpino_i2c_master_ip_virtual_base_seq;
  `uvm_object_utils(pulpino_i2c_master_ip_virtual_basic_read_seq)

  apb_master_basic_read_seq apb_master_basic_read_seq_h;

  //Variable : i3c_target_readOperationWith8bitsData_seq_h 
  //Instantiation of i3c_target_readOperationWith8bitsData_seq 
  i3c_target_readOperationWith8bitsData_seq  i3c_target_readOperationWith8bitsData_seq_h;

  event wr_rd;
  
  extern function new(string name ="pulpino_i2c_master_ip_virtual_basic_read_seq");
  extern task body();

endclass : pulpino_i2c_master_ip_virtual_basic_read_seq


function pulpino_i2c_master_ip_virtual_basic_read_seq::new(string name ="pulpino_i2c_master_ip_virtual_basic_read_seq");
  super.new(name);
  //read_key = new(1);
endfunction : new

task pulpino_i2c_master_ip_virtual_basic_read_seq::body();
  super.body();
  apb_master_basic_read_seq_h = apb_master_basic_read_seq::type_id::create("apb_master_basic_read_seq_h");
  i3c_target_readOperationWith8bitsData_seq_h = i3c_target_readOperationWith8bitsData_seq::type_id::create("i3c_target_readOperationWith8bitsData_seq_h");

   fork
    forever begin
      `uvm_info("slave_vseq",$sformatf("started slave vseq"),UVM_HIGH)
     // read_key.get(1);
      i3c_target_readOperationWith8bitsData_seq_h.start(p_sequencer.i3c_target_seqr_h);
     // -> wr_rd;
     // read_key.put(1);
      `uvm_info("slave_vseq",$sformatf("ended slave vseq"),UVM_HIGH)
    end
  join_none

  repeat(1) begin
    `uvm_info("master_vseq",$sformatf("started master vseq"),UVM_HIGH)
    apb_master_basic_read_seq_h.start(p_sequencer.apb_master_seqr_h);
    //wait(wr_rd.triggered);
    `uvm_info("master_vseq",$sformatf("ended master vseq"),UVM_HIGH)
  end
 endtask : body

`endif
