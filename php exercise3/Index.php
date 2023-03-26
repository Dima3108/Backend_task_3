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
                        </label><input type="text" asp-for="name" />
                
                </div>
                <div class="div_el">
                    
                        <label >
                            Введите ваш email:
                        </label><input type="text" asp-for="email" />
                  
                        
                    
                </div>
                <div class="div_el">
                    <label >
                        Выберите вашу дату рождения:
                    </label><input type="date" asp-for="date" />
                   
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
                       <!-- @{
                            Pol[] p = { Pol.Man, Pol.Wuman };
                            string[] s = { "Мужской", "Женский" };
                            for (int i = 0; i < p.Length; i++)
                            {
                                <label>
                                    @s[i]
                                    @if (i == 0)
                                    {
                                        <input type="radio" value="@(p[i])" asp-for="pol" class="form-check" checked />
                                    }
                                    else
                                    {
                                        <input type="radio" value="@(p[i])" asp-for="pol" class="form-check" />
                                    }
                                </label>
                            }


                        }-->
                    </label>

                </div>
                <div class="div_el">

                    Выберите количество конечностей:
                  <!--  @{

                        for (int i = 1; i <= 10; i++)
                        {
                            <label class="form-check-label">
                                @i.ToString()
                                @if (i != 1)
                                {


                                    <input type="radio" value="@i" asp-for="count_con" class="form-check" />
                                }
                                else
                                {
                                    <input type="radio" value="@i" asp-for="count_con" class="form-check" checked />
                                }
                            </label>
                        }

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

                    </label> <textarea asp-for="biograf"></textarea>
                </div>
                <div class="div_el">
                    <label >
                        С контрактом ознакомлен

                    </label> <input type="checkbox" asp-for="AWTC" class="form-check" />
                </div>
                <div class="div_el">
                    <select name="supers"  multiple>

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
                               <option value="$r1">$r0</option>
                            _END;
                         }
                        ?>
                    </select>
                </div>
                <div class="div_el">
                    <button type="submit" class="btn btn-primary">Отправить</button>
                </div>
            </div>
        </form>
</main>
</body>
</html>