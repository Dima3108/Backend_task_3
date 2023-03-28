<!DOCTYPE html>
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
                   
                        <label >
                            Введите ваше имя:
                        </label><input type="text" name="name" />
                
                </div>
                <div class="div_el">
                    
                        <label >
                            Введите ваш email:
                        </label><input type="email" name="email" />
                  
                        
                    
                </div>
                <div class="div_el">
                    <label >
                        Выберите вашу дату рождения:
                    </label><input type="date" name="date" />
                   
                </div>
                <div class="div_el">

                    <label>
                        Выберите пол:
                       
                        <?php 
                            require_once 'databaseconnection.php';
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

                    </label> <textarea name="biograf"></textarea>
                </div>
                <div class="div_el">
                    <label >
                        С контрактом ознакомлен

                    </label> <input type="checkbox" name="AWTC" class="form-check" id="awtc_ch" />
                </div>
                <div class="div_el">
                    <select name="supers[]"  multiple>

                      <!--  @{
                            string[] sspo = { "бессмертие", "левитация", "прохождение сквозь стены" };
                            for (int i = 0; i < sspo.Length; i++)
                            {
                                <option value="@sspo[i]">@sspo[i]</option>
                            }
                        }-->
                        <?php
                        require_once 'databaseconnection.php';
                        $query = "SELECT * FROM  supersposobnosti";
                        $result = $pdo->query($query);
                         while ($row = $result->fetch()){
                            $r0=htmlspecialchars($row['sposobnost']);
                            $r1=htmlspecialchars($row['id']);
                            echo<<<_END
                               <option value="$r0">$r0</option>
                            _END;
                         }
                        ?>
                    </select>
                </div>
                <div class="div_el">
                    <button type="submit" class="btn btn-primary" id="res_but">Отправить</button>
                </div>
            </div>
        </form>
        <script>
            var but=document.getElementById('awtc_ch');
            document.getElementById('res_but').style="display:none";
            but.addEventListener('click',function(){
               if(document.getElementById('awtc_ch').checked==true){
                  document.getElementById('res_but').style="display:block";
               }
               else{
                  document.getElementById('res_but').style="dispaly:none";
               }    
            });
            </script>
</main>
</body>
</html>