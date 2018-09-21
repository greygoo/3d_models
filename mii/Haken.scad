cutoff = [5,7,5];
case_height_till_cover = 1.8647;

module case() {
    import("/tmp/3dtest/test.stl", convexity=0);
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
    scale(0.9){
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
    scale(0.9){
        case_bottom();
    }
}

module bottom(){
    difference(){
        case_bottom();
        cutout_bottom();
    }
}

module top(){
    difference(){
        case_top();
        cutout_top();
    }
}

//bottom();
top();