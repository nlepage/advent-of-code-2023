def parse(input)
  sDirections, sNodes = input.split("\n\n")
  directions = sDirections.split('').map { |c| "LR".index c }
  nodes = sNodes.split("\n").map { |line| k, l, r = /(\w{3}) = \((\w{3}), (\w{3})\)/.match(line)[1..]; [k, [l, r]] }.to_h
  return directions, nodes
end

def solve1(input)
  directions, nodes = parse input
  
  i = 0
  pos = 'AAA'
  it = directions.each.cycle

  while pos != 'ZZZ' do
    pos = nodes[pos][it.next]
    i+=1
  end

  p i
end

def findZ(start, directions, nodes)
  i = 0
  it = directions.each.cycle
  pos = start

  loop do
    pos = nodes[pos][it.next]
    i+=1

    if !pos.end_with? 'Z'
      next
    end

    return i
  end
end

def solve2(input)
  directions, nodes = parse(input)

  start = nodes.keys.select { |key| key.end_with? 'A' }

  rates = start.map { |key| findZ(key, directions, nodes) }

  gcd = rates.inject { |a, b| a.gcd(b) }

  p gcd * rates.map { |rate| rate/gcd }.inject(&:*)
end

TEST1 = <<~EOF
RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)
EOF

TEST2 = <<~EOF
LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)
EOF

TEST3 = <<~EOF
LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)
EOF

INPUT = <<~EOF
LLRLLRLRLRRRLLRRRLRRLRLRLRLRLRLRRLRRRLRLLRRLRRLRRRLLRLLRRLLRRRLLLRLRRRLLLLRRRLLRRRLRRLRLLRLRLRRRLRRRLRRLRRLRRLRLLRRRLRRLRRRLLRRRLRLRRLLRRLLRLRLRRLRRLLRLLRRLRLLRRRLLRRRLRRLLRRLRRRLRLRRRLRRLLLRLLRLLRRRLRLRLRLRRLRRRLLLRRRLRRRLRRRLRRLRLRLRLRRRLRRLLRLRRRLRLRLRRLLLRRRR

TFN = (SMC, LQT)
JKL = (XDN, KPK)
JMF = (HGP, QKF)
RJR = (VMR, RRM)
FJS = (RMD, HSP)
QKS = (KDN, KDN)
VTN = (PQR, LVV)
PNS = (SDG, XJF)
RQC = (TDX, DSD)
HSH = (QTK, VDS)
SSM = (NFM, PRT)
FDX = (JJJ, SCZ)
MHS = (PBJ, THP)
DPV = (KXL, STJ)
HVP = (DPV, RGP)
TPN = (TJC, KMC)
TFD = (QVD, DRT)
HQH = (TMT, SXJ)
HGP = (TNG, GMK)
FCC = (HGB, MLQ)
MDJ = (CCH, HMG)
QKF = (GMK, TNG)
DBP = (FNP, TRB)
QNQ = (SKD, HRG)
VGC = (LFV, TVS)
NQD = (PTD, TCM)
GSQ = (PPP, KHS)
LKC = (QKG, TTL)
FDD = (TRX, NKV)
QMG = (QSR, SDR)
SXD = (DNN, KJC)
NXD = (RLB, RLB)
SBP = (PRG, CXT)
XDM = (RKH, VRF)
GHD = (JLX, VXS)
XJV = (VXS, JLX)
GXX = (TDJ, NXP)
DMQ = (SLH, RTD)
SMC = (RFR, DPS)
BBC = (HPF, CJL)
GVZ = (CQJ, HRT)
MMT = (VPH, MGD)
LCQ = (HSH, TPX)
NXC = (NXP, TDJ)
NLL = (VJM, QTP)
NQZ = (CRR, KCL)
KLT = (SFS, PSM)
SDR = (FBB, KGM)
GCS = (HNQ, BDH)
HLJ = (JXV, SPG)
SRP = (XXC, RKP)
QJH = (XDC, DBP)
XJF = (NHT, SLL)
QCD = (RQM, LCQ)
QSS = (KHD, QMG)
XNJ = (FJS, GLF)
PFH = (NSP, HSG)
VVD = (JLQ, VKF)
PNT = (PXQ, CMM)
PJG = (DBP, XDC)
TTL = (LFS, NHL)
GJM = (HVL, GMF)
BGM = (QBK, SKV)
DXD = (GNN, HQH)
JPP = (QHM, DXD)
LPH = (JKS, HBQ)
CDG = (LXQ, KTC)
PLF = (HGG, LRS)
JJP = (SRQ, NQD)
PBH = (CMM, PXQ)
HGD = (XGK, XCL)
NNM = (GTK, XCB)
TFG = (JHM, JMK)
VDQ = (PSM, SFS)
NDP = (CGF, LBM)
CGF = (KVF, TVM)
KDN = (KCL, CRR)
RQM = (HSH, TPX)
JKB = (JPP, VGH)
XDC = (FNP, TRB)
VDF = (BKD, NQQ)
TKN = (VGM, BDK)
NSN = (GJV, SPB)
DSD = (QVK, MVX)
VFX = (PKM, VTN)
FRC = (JBH, BCK)
XKX = (PNS, CVL)
VRF = (QHR, FDX)
JCV = (BGP, BGP)
JRC = (JKV, NBL)
HNQ = (QNQ, HFB)
BMV = (DBV, CFH)
FTC = (PKM, VTN)
KHS = (TFD, VPM)
JQX = (VBL, PPX)
HGM = (NFM, PRT)
BGD = (LCQ, RQM)
PSM = (KJB, SJH)
VXL = (TDB, HGD)
LKT = (LDB, MMT)
RJV = (CJL, HPF)
JBF = (FJC, QHH)
RBV = (QKS, CTD)
GBL = (DCX, JRF)
XVX = (XGT, DCJ)
GSD = (JMG, CVR)
RGP = (STJ, KXL)
HRV = (LPG, DMQ)
VPH = (PQF, KLF)
STP = (NMG, BXH)
TTH = (HMV, NCR)
MLQ = (SFP, GCS)
RCR = (LBM, CGF)
CCB = (HQB, VSQ)
QGL = (RRS, RRS)
HVL = (LDR, CXN)
QKG = (NHL, LFS)
XGN = (HGG, LRS)
JCG = (KBS, QLP)
PVX = (XHG, XPC)
TPD = (TDH, QLT)
XQG = (NXD, KSK)
KHL = (GQX, TSK)
GVF = (VBJ, DJL)
SGB = (XXC, RKP)
RKD = (BNP, PTZ)
QNS = (JKS, HBQ)
JXV = (BQX, PKN)
JVJ = (SRQ, NQD)
VLG = (BJL, MTP)
VLJ = (KBP, VGC)
HQL = (PLF, XGN)
DTR = (SKV, QBK)
GJV = (HLP, DQR)
DTX = (GBQ, XDM)
TDH = (KBL, PRK)
KLF = (RPC, BMG)
LBQ = (NRF, MGJ)
XHG = (FBL, JMF)
CBC = (TNT, TJS)
SVP = (LTD, JQX)
KCC = (NMX, NBF)
NFS = (HVL, GMF)
GMH = (RND, CSJ)
FVF = (QVH, XLR)
NHK = (MQT, HFR)
NBN = (VMR, RRM)
CSD = (CSK, JPS)
VQL = (THK, SXT)
HFB = (SKD, HRG)
KHD = (QSR, SDR)
NLV = (SDB, DDZ)
CNP = (JHX, PDP)
PRK = (KPS, DDS)
CQB = (BBP, GCQ)
PCJ = (JRF, DCX)
HSG = (JCV, NTF)
SXJ = (CML, RKD)
SFP = (HNQ, BDH)
DDZ = (GXX, NXC)
HLR = (NKV, TRX)
BJL = (XPH, MSC)
JFS = (KJC, DNN)
NPH = (TBX, QCG)
KBR = (PJX, GVF)
JQH = (VNT, KBT)
MBX = (PTB, BMR)
NXR = (JBT, KMD)
NCR = (PMB, MJR)
THP = (BRT, FDV)
RNG = (KJN, KTH)
RPC = (PRR, RBC)
XMR = (LSD, BMM)
HMG = (SSM, HGM)
PCH = (QJH, PJG)
MMG = (NBF, NMX)
QBJ = (HNS, JNR)
KBL = (DDS, KPS)
VBJ = (XJV, GHD)
GHT = (CVL, PNS)
VGH = (QHM, DXD)
GTK = (NCX, CCB)
BMR = (GMD, FHH)
FDV = (MBK, VJQ)
BKD = (CBQ, RVM)
QTP = (TXR, FVX)
VBL = (HMR, QFM)
QTK = (TPB, SHF)
RTD = (JRC, RNF)
QFR = (MDP, HTC)
MSF = (CSK, JPS)
PKM = (PQR, LVV)
VHK = (KHD, QMG)
VGL = (BCK, JBH)
VNT = (VKH, NLP)
KXN = (VCN, VPS)
HSP = (TMC, CMT)
LSD = (GHT, XKX)
LGN = (GNL, JDP)
QGC = (QLT, TDH)
NKV = (XPS, LKJ)
DJK = (KTH, KJN)
BCK = (NCF, MCQ)
FDS = (PSD, RBQ)
SCZ = (TDV, FKM)
PGQ = (DSV, NJR)
PTD = (VVD, BTH)
SLK = (SMB, GSQ)
MJR = (DMB, MBC)
BGC = (HRQ, MVB)
XLN = (QSS, VHK)
KFG = (MRB, JQL)
NQB = (TRR, SMV)
FMV = (PBJ, THP)
QGJ = (QQB, KNC)
PQR = (LTS, VDF)
THK = (NCK, DKX)
TDX = (QVK, MVX)
QCN = (DHN, STP)
KJN = (QGX, TQC)
CBS = (QSS, VHK)
DNN = (XQG, HGN)
BQX = (SXD, JFS)
CMT = (JGJ, NRC)
FJC = (FSB, LRK)
TPB = (RSH, TDK)
QXD = (XVX, PPF)
BTH = (VKF, JLQ)
CRR = (FPK, JHT)
CCH = (HGM, SSM)
QSP = (QNS, LPH)
RRS = (TTH, RNK)
RFH = (FCS, DPC)
VMR = (JTC, LCM)
TQC = (MRS, TFN)
CMM = (QCD, BGD)
FBL = (QKF, HGP)
KPD = (SPG, JXV)
CFQ = (TVG, JQN)
DCJ = (VFB, KBR)
PSD = (NNG, HQS)
CVR = (TBJ, JKB)
TMT = (CML, CML)
QHR = (JJJ, JJJ)
PRJ = (MTF, XCG)
JHT = (PHH, LQF)
NGS = (VGC, KBP)
QVK = (SBM, QXD)
RXD = (FXD, QKP)
DBV = (XLM, GLV)
RGG = (NGS, VLJ)
TPT = (GLF, FJS)
HTD = (DJC, FCC)
KFS = (MHS, FMV)
DQR = (QHQ, HVX)
NGX = (RGP, DPV)
PQC = (FVB, SLF)
FCK = (VDG, GVC)
TJS = (MXB, NXS)
RSH = (SLK, PTV)
NCF = (DSM, NSN)
VPM = (QVD, DRT)
MSB = (MKK, CNP)
JHD = (NPH, GCL)
JFN = (HVP, NGX)
SXT = (NCK, DKX)
LTS = (NQQ, BKD)
FSG = (LXQ, KTC)
DCS = (CKH, QVM)
FXR = (VDR, GVZ)
LJV = (PXD, DNT)
NMG = (GTD, JPM)
CVL = (SDG, XJF)
DRL = (PLF, XGN)
QKP = (VQG, BJN)
NNP = (JGK, PQC)
JMG = (TBJ, JKB)
FNV = (QVH, XLR)
KFR = (QKP, FXD)
BRT = (VJQ, MBK)
HTC = (LSP, NLV)
RLB = (QGL, QGL)
LSH = (NLL, NHN)
JQB = (JMG, CVR)
FVT = (NLL, NHN)
NVJ = (RCR, NDP)
CBQ = (NNP, SJR)
VGM = (FRC, VGL)
PCV = (KNG, DMN)
NNG = (QFV, VXL)
SPB = (HLP, DQR)
JKV = (QFG, DCS)
LGM = (XDN, KPK)
QMD = (XQN, LBQ)
GDP = (JPK, VNG)
RXL = (KMC, TJC)
TXR = (QDB, NJT)
QGX = (MRS, TFN)
LDB = (MGD, VPH)
KSK = (RLB, QPS)
RKH = (QHR, QHR)
JPM = (FXH, LPJ)
PPP = (TFD, VPM)
LDR = (TRV, JPF)
HVH = (VFX, FTC)
MRS = (SMC, LQT)
VTL = (RRS, ZZZ)
SGX = (KXN, QGK)
NHL = (DJK, RNG)
VKF = (HLJ, KPD)
JQN = (TPT, XNJ)
MSC = (BGM, DTR)
LCM = (FKN, GHR)
SDG = (NHT, SLL)
QHC = (MSF, CSD)
BPX = (CBS, XLN)
GTD = (LPJ, FXH)
TPX = (VDS, QTK)
KCL = (JHT, FPK)
MMV = (NQB, KQK)
JHV = (GTF, NFK)
FMH = (CBS, XLN)
JBH = (MCQ, NCF)
TMC = (NRC, JGJ)
TVS = (JKL, LGM)
NJC = (QBJ, VRB)
SDB = (NXC, GXX)
PCG = (PFH, LQN)
XPS = (RRK, BMV)
SHF = (RSH, TDK)
GLV = (BGC, BND)
TVM = (HTT, CBK)
PDP = (BBV, QFR)
TBJ = (JPP, VGH)
TTC = (QGJ, KTM)
HPF = (QLM, SDX)
RQX = (LDB, MMT)
NXP = (LQV, PSJ)
MDN = (QGC, TPD)
MQT = (XDT, PCG)
MTH = (KFS, SHQ)
SSK = (PJG, QJH)
CBX = (FCL, TRM)
HRQ = (GNV, VPF)
LQF = (NGH, QCN)
BDH = (HFB, QNQ)
VDR = (HRT, CQJ)
HGG = (DTC, TPL)
JQA = (FKM, TDV)
NFM = (JHV, HHR)
HFR = (PCG, XDT)
NHA = (NXC, GXX)
FHR = (PSD, RBQ)
LMB = (DNT, PXD)
NBL = (DCS, QFG)
CSJ = (LGH, MMV)
NHN = (VJM, QTP)
FCL = (GGN, VLS)
PSG = (QBD, TFC)
HVX = (NCL, KVD)
DJL = (XJV, GHD)
KVF = (HTT, CBK)
VNG = (CBX, XJD)
PJD = (MDJ, PKJ)
KVD = (HCG, PRJ)
SLF = (LVD, HRV)
KQK = (SMV, TRR)
TRR = (PJD, NDQ)
LVL = (CDG, FSG)
NXS = (KDD, LDC)
LRS = (DTC, TPL)
SRQ = (PTD, TCM)
HLP = (QHQ, HVX)
LVD = (LPG, DMQ)
XGK = (LMB, LJV)
JGJ = (BVG, DPF)
SSQ = (SGX, FRK)
TJC = (SVG, GMH)
JKS = (NFS, GJM)
SLL = (TPN, RXL)
JNC = (SSK, PCH)
GGN = (PVX, QJB)
HCG = (MTF, XCG)
VPS = (SSC, NNM)
CQJ = (RGD, KMV)
DPC = (PCJ, GBL)
JGK = (FVB, SLF)
XNP = (LBQ, XQN)
HTT = (CSC, PGQ)
KDJ = (PCV, BTT)
CXN = (JPF, TRV)
HGN = (NXD, KSK)
PTB = (FHH, GMD)
VPF = (NHK, JRS)
FTN = (QBJ, VRB)
PQF = (BMG, RPC)
DSM = (GJV, SPB)
TRV = (JFN, HML)
NTF = (BGP, RBV)
BNP = (HVH, SJL)
SMB = (KHS, PPP)
QFV = (TDB, HGD)
VCN = (NNM, SSC)
PDB = (TTC, KMH)
BBV = (MDP, MDP)
JNR = (FCK, LFC)
PPX = (HMR, QFM)
SMV = (NDQ, PJD)
DBM = (PCH, SSK)
DND = (MRG, JBF)
PHD = (MTH, LNP)
LQN = (NSP, HSG)
TVG = (XNJ, TPT)
RVS = (TFG, GLT)
AAA = (TTH, RNK)
DRT = (GXP, PSG)
KMH = (KTM, QGJ)
GCQ = (BCL, RVS)
MGJ = (KHL, TVF)
XQN = (MGJ, NRF)
GLT = (JHM, JMK)
KNG = (FNV, FVF)
QPX = (DMJ, SVP)
JPL = (LNP, MTH)
QGK = (VPS, VCN)
BGP = (QKS, QKS)
NPG = (SBP, MKL)
XGT = (KBR, VFB)
MXQ = (GCQ, BBP)
VRB = (HNS, JNR)
DJC = (HGB, MLQ)
SBM = (PPF, XVX)
LDC = (KFR, RXD)
BVG = (JQJ, QMH)
XDT = (PFH, LQN)
FPK = (LQF, PHH)
GQX = (PBH, PNT)
JBT = (RQX, LKT)
BBP = (RVS, BCL)
DSV = (NPG, BRB)
PXQ = (BGD, QCD)
GNN = (TMT, TMT)
CSX = (XNG, FXR)
LSL = (CFM, PDB)
HSK = (GBQ, XDM)
FSA = (HVH, SJL)
CTD = (KDN, NQZ)
JLQ = (KPD, HLJ)
LSP = (SDB, SDB)
KTH = (QGX, TQC)
XBX = (MRB, JQL)
PSJ = (JQH, FJF)
DFR = (GDP, DVB)
MKK = (JHX, PDP)
NDQ = (MDJ, PKJ)
FCS = (PCJ, GBL)
MKL = (PRG, CXT)
CDF = (HSK, DTX)
TVF = (TSK, GQX)
NJR = (NPG, BRB)
GMK = (GKS, QSP)
SSB = (DBM, JNC)
QLP = (QDX, DFR)
MFG = (NGS, VLJ)
LGH = (KQK, NQB)
KNC = (SSB, CBL)
TFC = (KLL, SRC)
RFR = (VDQ, KLT)
KMC = (GMH, SVG)
KTM = (KNC, QQB)
QSR = (FBB, KGM)
TCM = (VVD, BTH)
RRM = (LCM, JTC)
DMJ = (LTD, JQX)
XLM = (BGC, BND)
KPS = (VBQ, SHM)
PTZ = (SJL, HVH)
KLL = (KFG, XBX)
XJD = (FCL, TRM)
XPH = (DTR, BGM)
CFM = (KMH, TTC)
JJJ = (FKM, TDV)
VDS = (TPB, SHF)
MKR = (BMR, PTB)
HQB = (LVL, JTQ)
QHH = (LRK, FSB)
LPJ = (NVJ, PHR)
VSQ = (LVL, JTQ)
HNS = (LFC, FCK)
BJN = (MXQ, CQB)
RNF = (NBL, JKV)
SDX = (HLR, FDD)
FVX = (QDB, NJT)
FPV = (XNG, XNG)
JBL = (RQC, KLC)
RMD = (TMC, CMT)
PJX = (VBJ, DJL)
SVG = (RND, CSJ)
XCG = (SBQ, RNV)
TRX = (LKJ, XPS)
HMM = (PLB, LGN)
FKM = (BPX, FMH)
DCX = (QPX, GPQ)
LKJ = (BMV, RRK)
LQT = (RFR, DPS)
MVB = (VPF, GNV)
HQS = (QFV, VXL)
NCK = (PBX, LKC)
PBJ = (BRT, FDV)
LLA = (KCL, CRR)
TRB = (CBC, CPJ)
VQG = (MXQ, CQB)
GKS = (LPH, QNS)
CRK = (RCS, SLV)
FBB = (MMG, KCC)
XQK = (NVL, QHC)
CSC = (DSV, NJR)
JHM = (NJC, FTN)
FNP = (CBC, CPJ)
LXQ = (GGJ, TNJ)
GXP = (QBD, TFC)
KLC = (DSD, TDX)
VKH = (QCC, CRK)
FNK = (FCC, DJC)
KBS = (DFR, QDX)
HGB = (SFP, GCS)
XNG = (VDR, VDR)
MXB = (LDC, KDD)
MBC = (SSQ, PFJ)
BGG = (SXT, THK)
KBT = (VKH, NLP)
XTH = (KLC, RQC)
SJH = (JHD, NPX)
SHQ = (MHS, FMV)
NJT = (NBM, CDF)
QBD = (SRC, KLL)
CPJ = (TNT, TJS)
HRG = (RFH, PNK)
LQV = (JQH, FJF)
LNP = (KFS, SHQ)
VLS = (QJB, PVX)
JRF = (QPX, GPQ)
MVX = (SBM, QXD)
XPC = (FBL, JMF)
MNA = (HRT, CQJ)
RND = (LGH, MMV)
PMB = (DMB, MBC)
LFC = (GVC, VDG)
JTQ = (CDG, FSG)
KBP = (TVS, LFV)
HBQ = (GJM, NFS)
TSK = (PNT, PBH)
FVB = (HRV, LVD)
VJM = (FVX, TXR)
JPF = (HML, JFN)
DVB = (JPK, VNG)
FRK = (KXN, QGK)
GPQ = (DMJ, SVP)
KJC = (XQG, HGN)
QVH = (HTD, FNK)
STJ = (HQL, DRL)
SKD = (RFH, PNK)
GNL = (FVT, LSH)
SLH = (RNF, JRC)
XCL = (LMB, LJV)
NFK = (RGG, MFG)
MRG = (QHH, FJC)
BXH = (JPM, GTD)
VXS = (XGH, CFQ)
HML = (HVP, NGX)
VFB = (PJX, GVF)
NGH = (STP, DHN)
VSP = (VGM, BDK)
FHH = (SNM, VLG)
TNJ = (RKG, NXR)
GBQ = (RKH, RKH)
XDN = (TKN, VSP)
LPG = (RTD, SLH)
JNP = (LKR, HMM)
NSP = (JCV, NTF)
NQQ = (CBQ, RVM)
XCB = (NCX, CCB)
MSM = (NBN, RJR)
BMG = (PRR, RBC)
KMD = (LKT, RQX)
RNK = (HMV, NCR)
CBL = (DBM, JNC)
PKN = (SXD, JFS)
QPS = (QGL, VTL)
QDX = (GDP, DVB)
JQJ = (XNP, QMD)
GHR = (FDS, FHR)
DMN = (FNV, FVF)
RKP = (JQB, GSD)
LFV = (LGM, JKL)
DDS = (VBQ, SHM)
QFM = (JBL, XTH)
BCL = (TFG, GLT)
NBM = (HSK, DTX)
FJF = (KBT, VNT)
LTB = (PDB, CFM)
SHM = (CHT, DND)
DHN = (BXH, NMG)
GNV = (JRS, NHK)
NRC = (DPF, BVG)
BPF = (JVJ, JJP)
HHR = (GTF, NFK)
LTD = (PPX, VBL)
PKJ = (HMG, CCH)
DNT = (MDN, BQC)
TPL = (RJV, BBC)
GLF = (RMD, HSP)
JLX = (CFQ, XGH)
KTC = (GGJ, TNJ)
SRC = (KFG, XBX)
LBM = (TVM, KVF)
PFJ = (FRK, SGX)
QCC = (SLV, RCS)
PXD = (BQC, MDN)
QCG = (BPM, XQK)
RRK = (DBV, CFH)
QQB = (SSB, CBL)
JTP = (KBS, QLP)
JPK = (CBX, XJD)
SJL = (VFX, FTC)
RBC = (LDM, XMR)
SKV = (SGB, SRP)
QSB = (RJR, NBN)
GQG = (CNP, MKK)
TDK = (PTV, SLK)
LFS = (DJK, RNG)
JHX = (BBV, QFR)
PLB = (GNL, JDP)
TDV = (FMH, BPX)
QHQ = (KVD, NCL)
DMB = (SSQ, PFJ)
CXT = (JCG, JTP)
RCS = (LSL, LTB)
MBK = (XXT, JNP)
GPH = (KDJ, TPS)
VDG = (GQG, MSB)
DPS = (VDQ, KLT)
BDK = (VGL, FRC)
TBX = (BPM, XQK)
JMK = (FTN, NJC)
SBQ = (BPF, CXS)
XXC = (GSD, JQB)
JQL = (FPV, CSX)
BTT = (KNG, DMN)
SLV = (LSL, LTB)
SJR = (JGK, PQC)
KDD = (RXD, KFR)
GMF = (LDR, CXN)
CML = (BNP, BNP)
MDP = (LSP, LSP)
NVL = (CSD, MSF)
NLP = (CRK, QCC)
DKX = (LKC, PBX)
CBK = (PGQ, CSC)
NHT = (RXL, TPN)
NMX = (VQL, BGG)
MGD = (KLF, PQF)
TDB = (XCL, XGK)
JDP = (LSH, FVT)
GGJ = (NXR, RKG)
DPF = (QMH, JQJ)
PRR = (LDM, XMR)
PTV = (SMB, GSQ)
PHH = (NGH, QCN)
PPF = (DCJ, XGT)
CHT = (MRG, JBF)
QBK = (SGB, SRP)
BMM = (GHT, XKX)
CJL = (QLM, SDX)
BRB = (SBP, MKL)
QDB = (CDF, NBM)
LDM = (BMM, LSD)
PSH = (KDJ, TPS)
QMH = (XNP, QMD)
QLM = (FDD, HLR)
LKR = (PLB, LGN)
ZZZ = (RNK, TTH)
CXS = (JVJ, JJP)
KPK = (TKN, VSP)
QVM = (MSM, QSB)
SFS = (KJB, SJH)
KGM = (MMG, KCC)
RKG = (KMD, JBT)
MCQ = (NSN, DSM)
QJB = (XPC, XHG)
CFH = (XLM, GLV)
LVV = (LTS, VDF)
XLR = (HTD, FNK)
FXH = (NVJ, PHR)
TRM = (GGN, VLS)
TNG = (QSP, GKS)
HRT = (RGD, KMV)
TPS = (BTT, PCV)
PRT = (HHR, JHV)
QHM = (GNN, HQH)
JTC = (GHR, FKN)
KXL = (DRL, HQL)
KMV = (GPH, PSH)
GTF = (RGG, MFG)
FSB = (MBX, MKR)
XXT = (HMM, LKR)
RBQ = (HQS, NNG)
TDJ = (LQV, PSJ)
MRB = (FPV, FPV)
SNM = (MTP, BJL)
DTC = (BBC, RJV)
NRF = (TVF, KHL)
GCL = (TBX, QCG)
NPX = (NPH, GCL)
PNK = (DPC, FCS)
QVD = (PSG, GXP)
HMV = (MJR, PMB)
MTP = (XPH, MSC)
BQC = (TPD, QGC)
PBX = (TTL, QKG)
RGD = (PSH, GPH)
NCL = (PRJ, HCG)
VBQ = (CHT, DND)
NBF = (BGG, VQL)
KJB = (NPX, JHD)
CSK = (PHD, JPL)
SPG = (BQX, PKN)
FXD = (BJN, VQG)
QFG = (QVM, CKH)
CKH = (MSM, QSB)
JRS = (HFR, MQT)
BPM = (QHC, NVL)
MTF = (RNV, SBQ)
PRG = (JTP, JCG)
JPS = (PHD, JPL)
FKN = (FDS, FHR)
RNV = (CXS, BPF)
NCX = (VSQ, HQB)
VJQ = (XXT, JNP)
PHR = (NDP, RCR)
TNT = (MXB, NXS)
QLT = (PRK, KBL)
LRK = (MBX, MKR)
GVC = (MSB, GQG)
XGH = (JQN, TVG)
BND = (MVB, HRQ)
SSC = (GTK, XCB)
RVM = (NNP, SJR)
HMR = (JBL, XTH)
GMD = (VLG, SNM)
EOF

solve1 TEST1
solve1 TEST2
solve1 INPUT

solve2 TEST3
solve2 INPUT
