
var base = 3
var max  = 20
var data = [0]

var index = 0
for _ in 1...max{
    var applied = false
    while !applied{
        if index>=data.count{
            data.append(0)
        }
        if data[index]<base-1 {
            data[index] += 1
            while(index>0){
                index-=1
                data[index]=0
            }
            applied=true
        }else{
            index+=1
        }
    }
    
    var offset = data.count
    var value:String = ""
    while(offset>0){
        offset-=1
        value.appendContentsOf("\(data[offset])")
    }
    
    print("Value \(value)")
}
