# hello_switch

A simple P4 program used to introduce the language concepts.


## Install P4

git clone https://github.com/p4lang/p4factory.git

cd p4factory

git submodule update --init --recursive

./install_deps.sh

./autogen.sh
./configure

## Running tests

* Execute script into p4factory project to create virtual interfaces:
  
   sudo p4factory/tools/veth_setup.sh
  
* Build and execute bmv2 into hello_switch repository
  
  cd hello_switch
  
  make bm
   
  sudo ./behavioral­model
  
* There is three python applications:

  * receive.py -> Creates a listener into port 3 of the switch

  * send_one.py -> Sends one packet to the switch with the destination mac address of aa:bb:cc:dd:ee

  * add_demo_entries.py -> add one entry into the dmac table mapping mac aa:bb:cc:dd:ee to the port 3 of the switch
