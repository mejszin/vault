edifact_documents = ["APERAK", "AUTACK", "AUTHOR", "AVLREQ", "AVLRSP", "BALANC", "BANSTA", "BAPLIE", "BAPLTE", "BERMAN", "BMISRM", "BOPBNK", "BOPCUS", "BOPDIR", "BOPINF", "BUSCRD", "CALINF", "CASINT", "CASRES", "CHACCO", "CLASET", "CNTCND", "COACSU", "COARRI", "CODECO", "CODENO", "COEDOR", "COHAOR", "COLREQ", "COMDIS", "CONAPW", "CONDPV", "CONDRA", "CONDRO", "CONEST", "CONITT", "CONPVA", "CONQVA", "CONRPW", "CONTEN", "CONTRL", "CONWQD", "COPARN", "COPAYM", "COPINO", "COPRAR", "COREOR", "COSTCO", "COSTOR", "CREADV", "CREEXT", "CREMUL", "CUSCAR", "CUSDEC", "CUSEXP", "CUSPED", "CUSREP", "CUSRES", "DEBADV", "DEBMUL", "DEBREC", "DELFOR", "DELJIT", "DESADV", "DESTIM", "DGRECA", "DIRDEB", "DIRDEF", "DMRDEF", "DMSTAT", "DOCADV", "DOCAMA", "DOCAMI", "DOCAMR", "DOCAPP", "DOCARE", "DOCINF", "ENTREC", "FINCAN", "FINPAY", "FINSTA", "GENRAL", "GESMES", "HANMOV", "ICASRP", "ICSOLI", "IFCSUM", "IFTCCA", "IFTDGN", "IFTFCC", "IFTIAG", "IFTICL", "IFTMAN", "IFTMBC", "IFTMBF", "IFTMBP", "IFTMCA", "IFTMCS", "IFTMFR", "IFTMIN", "IFTRIN", "IFTSAI", "IFTSTA", "IFTSTQ", "IHCEBI", "IHCLME", "IMPDEF", "INFCON", "INFENT", "INSDES", "INSPRE", "INSREQ", "INSRPT", "INTCHG", "INVOIC", "INVRPT", "IPPOAD", "IPPOMO", "ISENDS", "ITRRPT", "JAPRES", "JINFDE", "JOBAPP", "JOBCON", "JOBMOD", "JOBOFF", "JUPREQ", "LEDGER", "LREACT", "LRECLM", "MEDPID", "MEDPRE", "MEDREQ", "MEDRPT", "MEDRUC", "MEQPOS", "MOVINS", "MSCONS", "ORDCHG", "ORDERS", "ORDRSP", "OSTENQ", "OSTRPT", "PARTIN", "PASREQ", "PASRSP", "PAXLST", "PAYDUC", "PAYEXT", "PAYMUL", "PAYORD", "PRICAT", "PRIHIS", "PROCST", "PRODAT", "PRODEX", "PROINQ", "PROSRV", "PROTAP", "PRPAID", "QALITY", "QUOTES", "RDRMES", "REBORD", "RECADV", "RECALC", "RECECO", "RECLAM", "RECORD", "REGENT", "RELIST", "REMADV", "REPREM", "REQDOC", "REQOTE", "RESETT", "RESMSG", "RESREQ", "RESRSP", "RETACC", "RETANN", "RETINS", "RPCALL", "SAFHAZ", "SANCRT", "SKDREQ", "SKDUPD", "SLSFCT", "SLSRPT", "SOCADE", "SSIMOD", "SSRECH", "SSREGW", "STATAC", "STLRPT", "SUPCOT", "SUPMAN", "SUPRES", "TANSTA", "TAXCON", "TIQREQ", "TIQRSP", "TPFREP", "TSDUPD", "TUPREQ", "TUPRSP", "UTILMD", "UTILTS", "VATDEC", "VESDEP", "WASDIS", "WKGRDC", "WKGRRE"]
non_edifact_documents = ["AVIEXP", "MEDREF", "PNRGOV", "LIMCLM", "FHSREG", "FSPREQ", "IFTERA"]
doc_comments = {
    "APERAK" => ["APERAK = Application Error And Acknowledgement"],
    "AUTACK" => ["AUTACK = Secure Authentication And Acknowledgement Message"],
    "AUTHOR" => ["AUTHOR = Authorization Message"],
    "AVLREQ" => ["AVLREQ = Availability request – interactive message"],
    "AVLRSP" => ["AVLRSP = Availability response – interactive message"],
    "BALANC" => ["BALANC = Balance message"],
    "BANSTA" => ["BANSTA = Banking Status"],
    "BAPLIE" => ["BAPLIE = Bayplan/Stowage Plan Occupied And Empty Locations Message"],
    "BAPLTE" => ["BAPLTE = Bayplan/Stowage Plan Total Numbers"],
    "BERMAN" => ["BERMAN = Berth management message"],
    "BMISRM" => ["BMISRM = Bulk marine inspection summary report message"],
    "BOPBNK" => ["BOPBNK = Bank Transactions And Portfolio Transactions Report"],
    "BOPCUS" => ["BOPCUS = Balance Of Payment Customer Transaction Report"],
    "BOPDIR" => ["BOPDIR = Direct Balance Of Payment Declaration"],
    "BOPINF" => ["BOPINF = Balance Of Payment Information From Customer"],
    "BUSCRD" => ["BUSCRD = Business credit report message"],
    "CALINF" => ["CALINF = Call Info"],
    "CASINT" => ["CASINT = Request For Legal Administration Action In Civil Proceedings Message"],
    "CASRES" => ["CASRES = Legal Administration Response In Civil Proceeding"],
    "CHACCO" => ["CHACCO = Chart of accounts message"],
    "CLASET" => ["CLASET = Classification information set message"],
    "CNTCND" => ["CNTCND = Contractual conditions message"],
    "COACSU" => ["COACSU = Commercial account summary message"],
    "COARRI" => ["COARRI = Container Discharge/Loading Report"],
    "CODECO" => ["CODECO = Container Gate-In/Gate-Out Report"],
    "CODENO" => ["CODENO = Permit Expiration/Clearance Ready Notice"],
    "COEDOR" => ["COEDOR = Container Stock Report"],
    "COHAOR" => ["COHAOR = Container Special Handling Order"],
    "COLREQ" => ["COLREQ = Request For A Documentary Collection"],
    "COMDIS" => ["COMDIS = Commercial Dispute"],
    "CONAPW" => ["CONAPW = Advice On Pending Works"],
    "CONDPV" => ["CONDPV = Direct Payment Valuation Message"],
    "CONDRA" => ["CONDRA = Drawing Administration"],
    "CONDRO" => ["CONDRO = Drawing Organization"],
    "CONEST" => ["CONEST = Establishment Of Contract Message"],
    "CONITT" => ["CONITT = Invitation To Tender Message"],
    "CONPVA" => ["CONPVA = Payment Valuation Message"],
    "CONQVA" => ["CONQVA = Quantity Valuation Message"],
    "CONRPW" => ["CONRPW = Response Of Pending Works"],
    "CONTEN" => ["CONTEN = Tender Message"],
    "CONTRL" => ["CONTRL = Edifact Control Message (Vers 2"],
    "CONWQD" => ["CONWQD = Work Item Quantity Determination"],
    "COPARN" => ["COPARN = Container Announcement"],
    "COPAYM" => ["COPAYM = Contributions for payment"],
    "COPINO" => ["COPINO = Container Pre-Notification"],
    "COPRAR" => ["COPRAR = Container Discharge/Loading Order"],
    "COREOR" => ["COREOR = Container Release Order"],
    "COSTCO" => ["COSTCO = Container Stuffing/Stripping Confirmation"],
    "COSTOR" => ["COSTOR = Container Stuffing/Stripping Order"],
    "CREADV" => ["CREADV = Credit Advice Message"],
    "CREEXT" => ["CREEXT = Extended Credit Advice Message"],
    "CREMUL" => ["CREMUL = Multiple Credit Advice"],
    "CUSCAR" => ["CUSCAR = Customs Cargo Report Message"],
    "CUSDEC" => ["CUSDEC = Customs Declaration Message"],
    "CUSEXP" => ["CUSEXP = Customs Express Consignment Declaration"],
    "CUSPED" => ["CUSPED = Periodic Customs Declaration"],
    "CUSREP" => ["CUSREP = Customs Conveyance Report Message"],
    "CUSRES" => ["CUSRES = Customs Response Message"],
    "DEBADV" => ["DEBADV = Debit Advice Message"],
    "DEBMUL" => ["DEBMUL = Multiple Debit Advice"],
    "DEBREC" => ["DEBREC = Debts recovery message"],
    "DELFOR" => ["DELFOR = Delivery Schedule Message"],
    "DELJIT" => ["DELJIT = Delivery Just-In Time Message"],
    "DESADV" => ["DESADV = Despatch Advice Message"],
    "DESTIM" => ["DESTIM = Equipment Damage And Repair Estimate"],
    "DGRECA" => ["DGRECA = Dangerous Goods Recapitulation"],
    "DIRDEB" => ["DIRDEB = Direct Debit Message"],
    "DIRDEF" => ["DIRDEF = Directory Definition"],
    "DMRDEF" => ["DMRDEF = Data maintenance request definition message"],
    "DMSTAT" => ["DMSTAT = Data maintenance status report/query message"],
    "DOCADV" => ["DOCADV = Documentary Credit Advice Message"],
    "DOCAMA" => ["DOCAMA = Advice Of An Amendment Of A Documentary Credit"],
    "DOCAMI" => ["DOCAMI = Documentary Credit Amendment Information"],
    "DOCAMR" => ["DOCAMR = Request For An Amendment Of A Documentary Credit"],
    "DOCAPP" => ["DOCAPP = Documentary Credit Application Message"],
    "DOCARE" => ["DOCARE = Response To An Amendment Of A Documentary Credit"],
    "DOCINF" => ["DOCINF = Documentary Credit Issuance Information Message"],
    "ENTREC" => ["ENTREC = Accounting entries message"],
    "FINCAN" => ["FINCAN = Financial Cancellation"],
    "FINPAY" => ["FINPAY = Multiple interbank funds transfer message"],
    "FINSTA" => ["FINSTA = Financial Statement Of An Account"],
    "GENRAL" => ["GENRAL = General Purpose"],
    "GESMES" => ["GESMES = Generic statistical message"],
    "HANMOV" => ["HANMOV = Cargo/Goods Handling And Movement"],
    "ICASRP" => ["ICASRP = Insurance claim assessment and reporting message"],
    "ICSOLI" => ["ICSOLI = Insurance claim solicitor’s instruction message"],
    "IFCSUM" => ["IFCSUM = Forwarding And Consolidation Summary Message"],
    "IFTCCA" => ["IFTCCA = Forwarding And Transport Shipment Charge Calculation"],
    "IFTDGN" => ["IFTDGN = Dangerous Goods Notification"],
    "IFTFCC" => ["IFTFCC = International Transport Freight Costs & Other Charge"],
    "IFTIAG" => ["IFTIAG = Dangerous Cargo List"],
    "IFTICL" => ["IFTICL = Cargo insurance claims message"],
    "IFTMAN" => ["IFTMAN = Arrival Notice"],
    "IFTMBC" => ["IFTMBC = Booking Confirmation Message"],
    "IFTMBF" => ["IFTMBF = Firm Booking Message"],
    "IFTMBP" => ["IFTMBP = Provisional Booking Message"],
    "IFTMCA" => ["IFTMCA = Consignment advice message"],
    "IFTMCS" => ["IFTMCS = Instruction Contract Status Message"],
    "IFTMFR" => ["IFTMFR = International Forwarding And Transport"],
    "IFTMIN" => ["IFTMIN = Instruction Message"],
    "IFTRIN" => ["IFTRIN = Forwarding And Transport Rate Information Message"],
    "IFTSAI" => ["IFTSAI = Forwarding And Transport Schedule And Availability"],
    "IFTSTA" => ["IFTSTA = Cargo Status"],
    "IFTSTQ" => ["IFTSTQ = International Multimodal Status"],
    "IHCEBI" => ["IHCEBI = Interactive health insurance eligibility and benefits inquiry and"],
    "IHCLME" => ["IHCLME = Health care claim or encounter request and response – interactive"],
    "IMPDEF" => ["IMPDEF = EDI implementation guide definition message"],
    "INFCON" => ["INFCON = Infrastructure condition message"],
    "INFENT" => ["INFENT = Enterprise Accounting Information"],
    "INSDES" => ["INSDES = Instruction to dispatch message"],
    "INSPRE" => ["INSPRE = Insurance Premium"],
    "INSREQ" => ["INSREQ = Inspection request message"],
    "INSRPT" => ["INSRPT = Inspection report message"],
    "INTCHG" => ["INTCHG = Interchange Control Structures"],
    "INVOIC" => ["INVOIC = Invoice Message"],
    "INVRPT" => ["INVRPT = Inventory Report Message"],
    "IPPOAD" => ["IPPOAD = Insurance policy administration message"],
    "IPPOMO" => ["IPPOMO = Motor insurance policy message"],
    "ISENDS" => ["ISENDS = Intermediary system enablement or disablement message"],
    "ITRRPT" => ["ITRRPT = In Transit Report Detail"],
    "JAPRES" => ["JAPRES = Job Application Result"],
    "JINFDE" => ["JINFDE = Job Information Demand Message"],
    "JOBAPP" => ["JOBAPP = Job Application Proposal Message"],
    "JOBCON" => ["JOBCON = Job Order Confirmation Message"],
    "JOBMOD" => ["JOBMOD = Job Order Modification Message"],
    "JOBOFF" => ["JOBOFF = Job Order Message"],
    "JUPREQ" => ["JUPREQ = Justified payment request message"],
    "LEDGER" => ["LEDGER = Ledger message"],
    "LREACT" => ["LREACT = Life Reinsurance Activity"],
    "LRECLM" => ["LRECLM = Life reinsurance claims message"],
    "MEDPID" => ["MEDPID = Person Identification Message"],
    "MEDPRE" => ["MEDPRE = Medical prescription message"],
    "MEDREQ" => ["MEDREQ = Medical Service Request"],
    "MEDRPT" => ["MEDRPT = Medical Service Report"],
    "MEDRUC" => ["MEDRUC = Medical Resource Usage And Cost"],
    "MEQPOS" => ["MEQPOS = Means Of Transport And Equipment Position"],
    "MOVINS" => ["MOVINS = Stowage Instruction"],
    "MSCONS" => ["MSCONS = Metered Services Consumption Report"],
    "ORDCHG" => ["ORDCHG = Purchase Order Change Request Message"],
    "ORDERS" => ["ORDERS = Purchase Order Message"],
    "ORDRSP" => ["ORDRSP = Purchase Order Response Message"],
    "OSTENQ" => ["OSTENQ = Order Status Enquiry"],
    "OSTRPT" => ["OSTRPT = Order Status Report"],
    "PARTIN" => ["PARTIN = Party Information Message"],
    "PASREQ" => ["PASREQ = Travel tourism and leisure product application status request – i"],
    "PASRSP" => ["PASRSP = Travel tourism and leisure product application status response –"],
    "PAXLST" => ["PAXLST = Passenger List Message"],
    "PAYDUC" => ["PAYDUC = Payroll Deductions Advice Message"],
    "PAYEXT" => ["PAYEXT = Extended Payment Order Message"],
    "PAYMUL" => ["PAYMUL = Multiple Payment Order Message"],
    "PAYORD" => ["PAYORD = Payment Order Message"],
    "PRICAT" => ["PRICAT = Price/Sales Catalogue Message"],
    "PRIHIS" => ["PRIHIS = Pricing History"],
    "PROCST" => ["PROCST = Project cost reporting message"],
    "PRODAT" => ["PRODAT = Product Data"],
    "PRODEX" => ["PRODEX = Product Exchange Reconciliation"],
    "PROINQ" => ["PROINQ = Product Inquiry"],
    "PROSRV" => ["PROSRV = Product service message"],
    "PROTAP" => ["PROTAP = Project tasks planning message"],
    "PRPAID" => ["PRPAID = Insurance Premium Payment"],
    "QALITY" => ["QALITY = Quality Data Message"],
    "QUOTES" => ["QUOTES = Quote Message"],
    "RDRMES" => ["RDRMES = Raw data reporting message"],
    "REBORD" => ["REBORD = Reinsurance Bordereau"],
    "RECADV" => ["RECADV = Receiving Advice"],
    "RECALC" => ["RECALC = Reinsurance Calculation"],
    "RECECO" => ["RECECO = Credit Risk Cover"],
    "RECLAM" => ["RECLAM = Reinsurance Claims"],
    "RECORD" => ["RECORD = Reinsurance core data message"],
    "REGENT" => ["REGENT = Registration of enterprise message"],
    "RELIST" => ["RELIST = Reinsured objects list message"],
    "REMADV" => ["REMADV = Remittance Advice Message"],
    "REPREM" => ["REPREM = Reinsurance Premium"],
    "REQDOC" => ["REQDOC = Request For Document"],
    "REQOTE" => ["REQOTE = Request For Quote Message"],
    "RESETT" => ["RESETT = Reinsurance Settlement"],
    "RESMSG" => ["RESMSG = Reservation"],
    "RESREQ" => ["RESREQ = Reservation request – interactive message"],
    "RESRSP" => ["RESRSP = Reservation response – interactive message"],
    "RETACC" => ["RETACC = Reinsurance Technical Account"],
    "RETANN" => ["RETANN = Announcement For Returns"],
    "RETINS" => ["RETINS = Safety And Hazard Data"],
    "RPCALL" => ["RPCALL = Repair call message"],
    "SAFHAZ" => ["SAFHAZ = Safety And Hazard Data Message"],
    "SANCRT" => ["SANCRT = Sanitary/Phytosanitary Certificate"],
    "SKDREQ" => ["SKDREQ = Schedule request – interactive message"],
    "SKDUPD" => ["SKDUPD = Schedule update – interactive message"],
    "SLSFCT" => ["SLSFCT = Sales Forecast"],
    "SLSRPT" => ["SLSRPT = Sales Data Report"],
    "SOCADE" => ["SOCADE = Social administration message"],
    "SSIMOD" => ["SSIMOD = Modification Of Identity Details Message"],
    "SSRECH" => ["SSRECH = Worker’s Insurance History Message"],
    "SSREGW" => ["SSREGW = Notification Of Registration Of A Worker"],
    "STATAC" => ["STATAC = Statement Of Account Message"],
    "STLRPT" => ["STLRPT = Settlement transaction reporting message"],
    "SUPCOT" => ["SUPCOT = Superannuation Contributions Advice Message"],
    "SUPMAN" => ["SUPMAN = Superannuation Maintenance Message"],
    "SUPRES" => ["SUPRES = Supplier Response"],
    "TANSTA" => ["TANSTA = Tank Status Report"],
    "TAXCON" => ["TAXCON = Tax control message"],
    "TIQREQ" => ["TIQREQ = Travel tourism and leisure information inquiry request – interactive"],
    "TIQRSP" => ["TIQRSP = Travel tourism and leisure information inquiry response – interactive"],
    "TPFREP" => ["TPFREP = Terminal performance message"],
    "TSDUPD" => ["TSDUPD = Timetable static data update – interactive message"],
    "TUPREQ" => ["TUPREQ = Travel"],
    "TUPRSP" => ["TUPRSP = Travel"],
    "UTILMD" => ["UTILMD = Utilities master data message"],
    "UTILTS" => ["UTILTS = Utilities time series message"],
    "VATDEC" => ["VATDEC = Value Added Tax"],
    "VESDEP" => ["VESDEP = Vessel Departure"],
    "WASDIS" => ["WASDIS = Waste Disposal Information"],
    "WKGRDC" => ["WKGRDC = Work Grant Decision Message"],
    "WKGRRE" => ["WKGRRE = Work Grant Request Message"],    
    "AVIEXP" => ["This document is part of the ODETTE standard."],
    "MEDREF" => ["This document is part of the MedCom standard."],
    "PNRGOV" => ["This document is part of the IATA PADIS standard.", "PNRGOV = Passenger Name Record"],
    "LIMCLM" => ["This document is part of the London Market standard."],
    "FHSREG" => ["This document is part of the NHAIS standard."],
    "IFTERA" => ["This document is part of the 1-stop standard.", "IFTERA = Export Receival Advice"], # Pre Receival Advices 
}

doc_image = []
(edifact_documents + non_edifact_documents).each_slice(6).to_a.each do |slice|
    doc_image << slice.map { |m| "[ ] #{m}" }.join("  ")
end

data = {}
for path in Dir["./edi/samples/*.edi"] do
    file_name = File.basename(path)
    message = file_name.split("_")[0]
    version = file_name.split("_")[1]
    date = File.mtime(path).strftime("%d/%m/%Y")
    if data.key?(message)
        if data[message].key?(version)
            data[message][version] << [file_name, date]
        else
            data[message][version] = [[file_name, date]]
        end
    else
        data[message] = {
            version => [[file_name, date]]
        }
    end
end

page = Builder.new(:css => "../css/style.css")
page.signature

top = 23 + doc_image.length
page.text(2, top, "File naming convention: <document>_<version>_<source>_<ref:optional>.edi")
page.replace("<", "&lt;")
page.replace(">", "&gt;")

page.image(4, 15, ["ELECTRONIC DATA INTERCHANGE", "      EDIFACT SAMPLES"])
caption = "For use of reference and testing, I am collating sample EDI messages and any"
page.text(2, 18, caption); page.italify(caption)
caption = "corresponding documentation that is available online. Some files are not entire"
page.text(2, 19, caption); page.italify(caption)
caption = "valid messages but smaller examples of use cases."
page.text(2, 20, caption); page.italify(caption)
page.image(2, 22, doc_image)

# Table
data.each do |message, versions|
    page.replace("[ ] #{message}", "[X] #{message}")
    page.linkify(" #{message}", "\##{message}")
    page.partition(top += 2, message)
    top += 1
    if doc_comments.key?(message)
        page.image(2, top + 1, doc_comments[message])
        doc_comments[message].each { |line| page.italify(line) }
        top += 1 + doc_comments[message].length
    end
    versions.each do |version, messages|
        messages.each do |file_name, date|
            page.row(top += 1, ["Version #{version.ljust(4, " ")}", file_name], [date])
            page.linkify(file_name, "../edi/samples/#{file_name}")
        end
    end
end

# Save
page.save("./edi/samples.html")