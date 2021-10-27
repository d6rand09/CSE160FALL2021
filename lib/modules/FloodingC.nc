#include "../../includes/CommandMsg.h"
#include "../../includes/packet.h"

configuration FloodingC{
    provides interface Flooding;
}
Implementation {
    components FloodingP;
    Flooding = FloodingP;

    components new simpleSend(AM_PACK);
    FloodingP.simpleSend-> SimpleSendC;

    components new HashmapC(uint32_t, 20);
    FloodingP.PreviousPackets -> HashmapC;
}