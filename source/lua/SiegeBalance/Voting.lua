
--- this *maybe* shouldn't be in siege core lol
if Server then

    local oldStartVote = StartVote
    function StartVote(voteName, client, data)
        if voteName == "ShineCustomVote" then
            data.VoteQuestion = "POLL: " .. data.VoteQuestion
        end
        return oldStartVote(voteName, client, data)
    end
    
end