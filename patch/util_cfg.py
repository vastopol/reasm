import angr
from angrutils import *

# load your project

proj = angr.Project('/bin/ls', load_options={'auto_load_libs': False})
# proj = angr.Project('/cgc_binaries/CADET_00001', load_options={'auto_load_libs': False})

# Generate a static CFG

cfg = proj.analyses.CFGFast()
print("This is the graph:", cfg.graph)
print("It has %d nodes and %d edges" % (len(cfg.graph.nodes()), len(cfg.graph.edges())))

# generate a dynamic CFG

# cfg2 = p.analyses.CFGEmulated(keep_state=True)
# print("This is the graph:", cfg2.graph)
# print("It has %d nodes and %d edges" % (len(cfg2.graph.nodes()), len(cfg2.graph.edges())))


# fancy cfg

# main = proj.loader.main_object.get_symbol("main")
# start_state = proj.factory.blank_state(addr=main.rebased_addr)
# cfg = proj.analyses.CFGEmulated(fail_fast=True, starts=[main.rebased_addr], initial_state=start_state)
plot_cfg(cfg, "true_cfg", asminst=True, remove_imports=True, remove_path_terminator=True)


