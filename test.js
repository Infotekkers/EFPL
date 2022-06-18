m =  function(n) {
    if(n===0)
         return 0;
    if(n===1)
        return 1;
    let fibo = [0,1];
    for(let i = 2; i<=n;i++){
       fibo.push(fibo[i-1] + fibo[i-2])      
           }
           return fibo[n-1] + fibo[n-2];
   }
   m(0);
   m(1);
   console.log("fibonanci 2",m(30));