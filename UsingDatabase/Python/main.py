import connect_to_db
import add_clan
import start_war
import change_building_type
import change_user_duty
import set_clan_slogan


cnxn = connect_to_db.connect_to_db()

print (
        'Enter the command number:\n' +
        '1-Add Clan\n' +
        '2-Start War\n' +
        '3-Change Default Building Type\n' +
        '4-Change User Duty\n' +
        '5-Change Clan Slogan\n'
       )
command = raw_input()
# TODO: age nemishod ham bayad ye kari bokonim
if command == '1':
    add_clan.add_clan(cnxn)
elif command == '2':
    start_war.start_war(cnxn)
elif command == '3':
    change_building_type.change_building_type(cnxn)
elif command == '4':
    change_user_duty.change_user_duty(cnxn)
elif command == '5':
    set_clan_slogan.set_clan_slogan(cnxn)