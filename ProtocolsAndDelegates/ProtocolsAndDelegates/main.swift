protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler{
    var delegate: AdvancedLifeSupport?
    
    func assessSituation (){
        print("can you tell me what happened?")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport{
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic performs CPR")
    }
    
    
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("save this mofo")
    }
    func useStethescope(){
        print("Do heart things")
    }
    
    
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings stayng alive")
    }
    func useDrill(){
        print("whirrr")
    }
}

let emilio = EmergencyCallHandler()
let doctor = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
