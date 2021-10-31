ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


print("Testing")
contracts = {
    {
        requester = "Tomer",
        type = "car",
        items = {
            {
                name = "adder",
                label = "Adder",
                quantity = 1 
            },
            --[[{
                name = "adder",
                label = "Adder",
                quantity = 2 
            },]]
            --[[{
                name = "formula",
                label = "Formula",
                quantity = 1 
            },]]
        },
        money = 40000
    },
    {
        requester = "Ram",
        type = "car",
        items = {
            [1] = {
                name = "adder",
                label = "Adder",
                quantity = 2 
            },
            [2] = {
                name = "deevo",
                label = "Deevo",
                quantity = 2 
            },
            [3] = {
                name = "adder",
                label = "Adder",
                quantity = 2 
            },
        },
        money = 40000
    }
}
MySQL.Async.execute("INSERT INTO availablecontracts (type, requester, state, items) VALUES (@type, @request, @state, @items)", {["@type"] = contracts[1].type, ["@request"] = contracts[1].requester, ["@state"] = 0, ["@items"] = json.encode(contracts[1].items)})
--print("HIIII")
--[[MySQL.Async.fetchAll("SELECT * FROM availablecontracts WHERE id=4", {}, function(result)
    print("HELOOOO")
    print("LENGTH IS " .. #result)
    list = json.decode(result[1].items)
end)]]


ESX.RegisterServerCallback("trucking:checkAvailableContract", function(source, cb, id)
    print("SELECT * FROM availablecontracts WHERE id=" .. id)
    MySQL.Async.fetchAll("SELECT * FROM availablecontracts WHERE id=" .. id, {}, function(result)
    if #result ~= 0 and result[1].state == 0 then
        print("Ready to send contract " .. result[1].type)
        MySQL.Async.execute("UPDATE availablecontracts SET state = 1 WHERE id=" .. id, {})
        cb(true)
        TriggerClientEvent("trucking:startContract", source, result[1])
        return
    end
    print("Failed")
    cb(false)
    end)
end)

ESX.RegisterServerCallback("trucking:getAvailableContracts", function(source, cb)
    MySQL.Async.fetchAll("SELECT * FROM availablecontracts WHERE state=0", {}, function(result)
        print(#result)
        --result[1].items = json.decode(result[1].items)
        for i=1,#result,1 do
            result[i].items = json.decode(result[i].items)
        end
        cb(result)
    end)
end)

AddEventHandler("trucking:finishContract", function(details)
    MySQL.Async.execute("DELETE FROM availablecontracts WHERE id=@orderid", {["@orderid"] = details.id})
    if details.type == "car" then
        for k, v in pairs(details.items) do
            MySQL.Async.execute("UPDATE vehicles SET stock=stock + 1 WHERE id=@orderid", {["@orderid"] = details.id})
        end
    end
end)