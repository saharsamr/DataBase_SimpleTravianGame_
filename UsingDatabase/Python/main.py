import connect_to_db
import add_clan
import start_war
import change_building_type


cnxn = connect_to_db.connect_to_db()

print ('Enter the command number:\n1-Add Clan\n2-Start War\n3-Change Default Building Type\n')
command = raw_input()

if command == '1':
    add_clan.add_clan(cnxn)
elif command == '2':
    start_war.start_war(cnxn)
elif command == '3':
    change_building_type.change_building_type(cnxn)
