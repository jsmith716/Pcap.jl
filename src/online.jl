export cap_open_live, cap_set_filter, cap_close,
    cap_loop

if isfile(joinpath(dirname(@__FILE__),"..","deps","deps.jl"))
    include("../deps/deps.jl")
else
    error("Pcap not properly installed. Please run Pkg.build(\"Pcap\")")
end

function cap_open_live(device::Ptr{UInt8}, snaplen::Int32, promisc::Int32, ms::Int32)
    ccall((:_cap_open_live, Pcap.libjlcap), Int32, (Ptr{UInt8}, Int32, Int32, Int32), device, snaplen, promisc, ms)
end

function cap_set_filter(filter::Ptr{UInt8})
    ccall((:_cap_set_filter, Pcap.libjlcap), Int32, (Ptr{UInt8},), filter)
end

function cap_close()
    ccall((:_cap_close, Pcap.libjlcap), Void, ())
end

function cap_loop()
    ccall((:_cap_loop, Pcap.libjlcap), Int32, ())
end
