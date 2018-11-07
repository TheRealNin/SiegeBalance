

local kDefaultMaxAudibleDistance = 35 -- was 50
function SoundEffect:OnCreate()

    Entity.OnCreate(self)
    
    InitMixin(self, SignalListenerMixin)
    
    self.playing = false
    self.positional = true
    self.assetIndex = 0
    self.volume = 1
    
    self.predictorId = Entity.invalidId
    
    self:SetRelevancyDistance(kDefaultMaxAudibleDistance)
    
    if Server then
    
        self.assetLength = 0
        self.startTime = 0
        
    end
    
    if Client then
    
        self.clientPlaying = false
        self.clientAssetIndex = 0
        self.soundEffectInstance = nil
        
    end
    
    self:SetUpdates(true)
    
end