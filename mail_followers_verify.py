import psycopg2

with open("list_duplicate.txt","w") as file:
    file.write("")

db_input = psycopg2.connect(
    host="localhost",
    database= #base odoo 8,
    user= #user odoo 8,
    password= #pass odoo 8
)

connect_input = db_input.cursor()
connect_input.execute("SELECT * FROM mail_followers")
data_input = connect_input.fetchall()

values = []
i=0
f= open("list_duplicate.txt","a")
for data in data_input:
    if data[1:] in values:
        f.write(f"id : {data[0]} \n")
        i+=1
        pass
    else:
        values.append(data[1:])
print(f"Nombre de duplication trouvé : {i}")
f.close()