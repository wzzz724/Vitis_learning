# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
type_r { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
in1 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 24
	offset_end 35
}
in2 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 36
	offset_end 47
}
out_r { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 48
	offset_end 59
}
size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 60
	offset_end 67
}
ap_start { }
ap_done { }
ap_ready { }
ap_continue { }
ap_idle { }
event_start { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


