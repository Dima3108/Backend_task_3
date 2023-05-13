<!DOCTYPE html>
<!--Файл главной страницы приложения-->
<html>
    <head>
         <link rel="stylesheet" href="/bootstrap/bootstrap.min.css" />
         <title>Задание 3</title>
</head>
<style>
    .div_el{
        display:block;
        background-color:aquamarine;
        align-content:center;
    }
</style>
    <body>
      <main>
        <form  action="ReadMessage.php" method="post" class="form-control">
            <div class="div_el">
                <div >
                   
                        <label class="form-label">
                            Введите ваше имя:
                        </label>
                        <input type="text" name="name" id="name"  value="<?php if(!empty($_COOKIE['user_nvalue'])){echo $_COOKIE['user_nvalue'];} ?>" />
                      <!--  <?php
                        if(isset($_COOKIE['user_nam'])){
                            $ckval=$_COOKIE['user_nam'];
                           
                          
                        }
                        else{
                           
                        }
                        ?>-->
                        <label id='name_sp' ><?php
                        if (!empty($_COOKIE['user_nam'])) {
                            $ckval = $_COOKIE['user_nam'];
                             echo $ckval;

                        }
                        ?></label>
                </div>
            </div>
            <div class="div_el">
                    <div>
                        <label class="form-label">
                            Введите ваш email:
                        </label><input type="email" name="email" id="email" value="<?php if(!empty($_COOKIE['user_evalue'])){echo $_COOKIE['user_evalue'];} ?>" >
                        
                        
                        <label id="email_sp">
                           <?php
                        if (!empty($_COOKIE['user_email'])) {
                            $ckval1 = $_COOKIE['user_email'];
                            // GenerateScriptForInsertValue("email",$ckval);
                            //echo "<span id='email_sp'>".$ckval."</span>";
                            echo $ckval1;
                        }   
                        ?>
                        </label>
                    </div>  
                    
            </div>
            <div class="div_el">
                <div>
                    <label class="form-label">
                        Выберите вашу дату рождения:
                    </label>
                    <input type="date" name="date" id="date" value="<?php 
                    if(!empty($_COOKIE['user_dvalue'])){
                        echo $_COOKIE['user_dvalue'];
                    }
                    
                    ?>" required/>
                    <!---->
                   <label id="date_sp">
                    <?php
                    if (!empty($_COOKIE['user_date'])) {
                        $ckval = $_COOKIE['user_date'];
                        echo $ckval;
                       // GenerateScriptForInsertValue("date",$ckval);
                       /* echo "<span id='date_sp' >".$ckval
                        ."</span>";*/
                    } else {
                       // echo "<span id='date_sp'></span>";
                    }
                    ?>
                   </label>
                </div>
            </div>
            <div class="div_el">

                    <label>
                        Выберите пол:
                       
                        <?php 
                         //   require_once 'databaseconnection.php';
                        require_once 'LibraryPchMain.php';
                        $query = "SELECT * FROM POL";
                        $result = $pdo->query($query);
                        $count=0;
                        while ($row = $result->fetch()){
                             $r0 = htmlspecialchars($row['pol']);
                             $r1 = htmlspecialchars($row['id']);
                             if($count>0){

                             
                             echo<<<_END
                            
                              <label>$r0
                              <input type="radio" value="$r1" class="form-check" name="pol">
                              </label>
                             
                              _END;
                             }else{
                                echo <<<_END
                            
                              <label>$r0
                              <input type="radio" value="$r1" class="form-check" name="pol" checked>
                              </label>
                             
                              _END;
                             }
                              $count++;
                        }
                        ?>
                        </div>
                       <!-- -->
                    </label>

            </div>
            <div class="div_el">

                    Выберите количество конечностей:
                  <!--  

                    }-->
                    <?php
                    for($i=1;$i<=10;$i++){
                        if($i!=1){
                           echo "<label>$i <input type='radio' value='$i' name='count'> "; 
                        }
                        else{
                            echo "<label>$i <input type='radio' value='$i' name='count' checked> ";
                        }
                    }
                    ?>
            </div>
            <div class="div_el">
                    
                    <label class="form-check-label">
                        Ваша биография:

                    </label> <textarea name="biograf" id="commit" ><?php if(!empty($_COOKIE['user_cvalue'])){echo $_COOKIE['user_cvalue'];} ?></textarea>
            </div>
            <div class="div_el">
                    <label >
                        С контрактом ознакомлен

                    </label> <input type="checkbox" name="AWTC" class="form-check" id="awtc_ch" required/>
            </div>
            <div class="div_el">
                    <select name="supers[]"  multiple>

                      
                        <?php
                       // require_once 'databaseconnection.php';
                        require_once 'LibraryPchMain.php';
                        $query = "SELECT * FROM  supersposobnosti";
                        $result = $pdo->query($query);
                         while ($row = $result->fetch()){
                            $r0=htmlspecialchars($row['sposobnost']);
                            $r1=htmlspecialchars($row['id']);
                            echo<<<_END
                               <option value="$r1">$r0</option>
                            _END;
                         }
                        ?>
                    </select>
            </div>
                <?php
                echo "<input type='hidden' id='suc_token' name='suc_token' value='".get_default_tocken()."'>";
                ?>
              <!--  <input type="hidden" id="suc_token" name="suc_token" />-->
                <div>
                    <h3>Для отправки формы вы должны согласиться с контрактом. </h3>
                </div>
                <div class="div_el">
                    <button type="submit" class="btn btn-primary" id="res_but">Отправить</button>
                </div>
           <!-- </div>-->
        </form>
       
       <!-- <script>
            var but=document.getElementById('awtc_ch');
            document.getElementById('res_but').style="display:none";
            but.onclick=function(){
                 if(document.getElementById('awtc_ch').checked){
                  document.getElementById('res_but').style="display:block";
               }
               else{
                  document.getElementById('res_but').style="display:none";
               }  
            }
          
            </script>-->
          <!--  <script src="Index.js"></script>-->
           <script src="SaveDataIndex.js"></script>
</main>
</body>
</html>