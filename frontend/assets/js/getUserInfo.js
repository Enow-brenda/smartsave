async function getuser_info(){
    const token = localStorage.getItem('token')
   
    try{
        const response = await fetch(`http://localhost:3000/api/custom-api/${dbtype}/${dbname}/users`, {
           method: 'GET',  
               headers: {
               'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`
               },
               credentials: "include", // 🔥 Sends and receives cookies
               
       });
       const userData = await response.json()
      
       if(userData){
        document.getElementById("username").innerText = userData[0].username
        document.getElementById("joinedDate").innerText = "Member since " + userData[0].createdAt.split('T')[0]
       }
       
    }catch(error){
        console.log(error)
    }
   

}