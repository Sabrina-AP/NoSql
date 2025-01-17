import React from 'react';
import {useState, useEffect} from 'react';  
import Appfc from '../reduxs/atualizafc';




export default function Fale_conosco(){
  
  const [mensagens, setMensagens ] = useState([]);
  const [render, setRender] = useState(false);
  const [msg, setMsg] = useState(false);
  const [nome, setNome] = useState(''); 
  const [mensagem, setMensagem] = useState('');
  

  useEffect(() => {
      async function fetchData(){
          const url =  "http://localhost:3333/return"; //"http://localhost/projetobd/banco_dados/ClassMensagem.php";
          const response = await fetch(url);
          setMensagens(await response.json());
      }fetchData();    
  }, [render]);

  
  async function envioMensagem(event) {
      event.preventDefault();

      const data ={
      
        nome: nome,
        mensagem: mensagem,
  
       
      }

      const url =   "http://localhost:3333/fale_conosco/envio"; //"http://localhost/projetobd/banco_dados/ClassMensagem1.php";

      fetch(url, {
          method: "POST",
          headers:{
            "Content-type":"application/json"
          },
          body:  JSON.stringify(data)
      }).then((response) => response.json()).then((dados) => {
          setMsg(dados)
      });
      setRender(!render);
      setTimeout(() => {
        setMsg(false);
        setRender(true);
      }, 1500);


      setNome('');
      setMensagem('');
  }
  
    return(
      
      <div id="fale">
        
        <title>Fale Conosco</title>
        
        <main className="container-fluid">
          <header>
            <h1>Fale Conosco</h1>
          </header>

          <hr/>
          <div>  
            <section className="container"> 
              <div className="row col-lg-8 mx-auto">
                  <div className="col pr-5">
                      <img width="40px" src="./imagens/email.jpg" alt="Email"/>contato@fullstackeletrosabrina.com
                  </div>
                  <div className="col pl-5 col-lg-4 mx-auto">
                      <img width="40px" src="./imagens/whatsapp.jpg" alt="Whatsapp"/>(11) 98888-88888
                  </div>
              </div>
            </section>
            <br />
            <br />
          </div>


          <div className="row col-lg-4 mx-auto">
            <Appfc />
          </div> 

          
          <div>
            <form method='post' className="col-lg-8 mx-auto" onSubmit={envioMensagem}>
              <section className="container-fluid">
                  <div className="form-group-sm">
                    <label>Nome:</label>
                    <input className= "form-control" name="nome" id="nome" value={nome} onChange={event => setNome(event.target.value)}  type="text" placeholder="Seu nome"/>
                  </div>
                  <div className="form-group-sm">  
                    <label>Mensagem:</label>
                    <textarea className= "form-control"  name="mensagem"  value={mensagem} id="mensagem" onChange={event => setMensagem(event.target.value)} placeholder="Digite sua mensagem"></textarea>
                    <button className="col-lg-12 btn btn-success"  type="submit">Enviar mensagem</button> <br/><br/>
                    <button className="col-lg-12 btn btn-info" type="reset">Limpar dados</button><br/><br/>   
                  </div>
              </section>
            </form>  
          </div>
          
          { 
            msg && <div className="alert alert-success mx-auto mt-4 w-75" role="alert">
              Agradecemos por sua mensagem!
            </div>
          }

          <div className="col-lg-8 mx-auto">
            <div>
                  <div >
                    
                      {mensagens.map((item) =>{
                          return(
              
                              <div className="col-lg-12" key={item.idcoment}>
                                  <hr/><hr/>
                                  <div>
                                      Data: {item.data}
                                  </div>
          
                                  <div>
                                      Cliente {item.nome} escreveu: {item.mensagem}
                                  </div>
                                  <hr/><hr/>
                                  <br/>
                              </div>
                          )            
                      })}
                  </div>
                  <br/>
                  <br/>
              </div>
          </div>
      
        </main>
      </div>
    );
}
