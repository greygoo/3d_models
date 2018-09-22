cutoff = [5,7,5];
case_height_till_cover = 1.8647;

module case() {
    import("basic.stl", convexity=0);
}


module cutoff_top(){
    translate([0,0,cutoff[2]/2]) cube(cutoff, center = true);
}


module cutoff_bottom(){
    translate([0,0,- cutoff[2]/2]) cube(cutoff, center = true);
}

module case_bottom() {
    difference(){
    case();
    cutoff_top();
    }
}


module case_top() {
    difference(){
    case();
    cutoff_bottom();
    }
}

module cutout_top(){
    scale([0.85, 0.92, 1]){
        hull(){
            difference(){
                case_top();
                translate([0,0,1.8647]) {
                    cutoff_top();
                }
            }
        }
    }
}



module cutout_bottom() {
    scale([0.85, 0.92, 0.9]){
        case_bottom();
    }
}

module rim_top() {
    scale([1.1,1.05,1])
        resize([0,0,0.4])
            cutout_top();
}

module rim_bottom() {
    translate([0,0,0.39])
        scale([1.09,1.04,1])
            resize([0,0,0.4])
                cutout_bottom();
}



module bottom(){
    difference(){
        case_bottom();
        cutout_bottom();
    }
    difference(){
        rim_bottom();
        translate([0,0,0.4])
            cutout_bottom();    
    }
}

module top(){
    difference(){
        case_top();
        cutout_top();
        rim_top();
    }
}

//bottom();
top();