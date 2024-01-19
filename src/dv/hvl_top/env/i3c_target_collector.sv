`ifndef I3C_TARGET_COLLECTOR_INCLUDED_
`define I3C_TARGET_COLLECTOR_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: i3c_target_collector
// This component is used to pass the i3c data to scorboard
//--------------------------------------------------------------------------------------------
class i3c_target_collector extends uvm_component;
  `uvm_component_utils(i3c_target_collector)

  //variable : i3c_target_coll_analysis_port
  //Used to send the data from the i3c_target_collector
  uvm_analysis_port#(i3c_target_tx) i3c_target_coll_analysis_port;

  //variable : i3c_target_coll_imp_port
  //Used to get the data from the i3c_target_monitor_proxy
  uvm_analysis_imp#(i3c_target_tx, i3c_target_collector) i3c_target_coll_imp_port;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "i3c_target_collector", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern function void write(i3c_target_tx t);

endclass : i3c_target_collector

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - i3c_target_collector
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function i3c_target_collector::new(string name = "i3c_target_collector",
                                 uvm_component parent = null);
  super.new(name, parent);
  i3c_target_coll_analysis_port = new("i3c_target_coll_analysis_port",this);
  i3c_target_coll_imp_port = new("i3c_target_coll_imp_port",this);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
// Builds the spi slave collector component
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void i3c_target_collector::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

//--------------------------------------------------------------------------------------------
// Function : write
// Parameters : 
// t  - i3c_target_tx
//--------------------------------------------------------------------------------------------
function void i3c_target_collector::write(i3c_target_tx t);

 `uvm_info(get_type_name(),$sformatf("Req print = %0s",t.sprint()),UVM_HIGH) 
 i3c_target_coll_analysis_port.write(t);

endfunction : write


`endif

