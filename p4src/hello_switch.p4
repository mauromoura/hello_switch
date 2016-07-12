header_type ethernet_t {
    fields {
        dstAddr : 48;
        srcAddr : 48;
        etherType : 16;
    }
}

header ethernet_t ethernet;

parser start {
    return parse_ethernet;
}

parser parse_ethernet {
    extract(ethernet);
    return ingress;
}

action _drop() {
    drop();
}

action _nop() {
}

action forward(port) {
    modify_field(standard_metadata.egress_spec, port);
}

table dmac {
    reads {
        ethernet.dstAddr : exact;
    }
    actions {
        forward;_drop;
    }
    size : 512;
}

control ingress {
    apply(dmac);
}

control egress {
}
