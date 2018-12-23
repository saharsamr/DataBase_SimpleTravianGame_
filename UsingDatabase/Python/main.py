import connect_to_db
import add_clan
import start_war
import change_building_type
import change_user_duty
import set_clan_slogan
import remove_user_from_clan
import view_clan_wars_list
import add_user_to_clan
import add_user_duty
import add_user
import add_role
import add_building
import view_list_of_clans


cnxn = connect_to_db.connect_to_db()

print (
        'Enter the command number:\n' +
        '1-Add Clan\n' +
        '2-Start War\n' +
        '3-Change Default Building Type\n' +
        '4-Change User Duty\n' +
        '5-Change Clan Slogan\n' +
        '6-Remove a User From Clan\n' +
        '7-View List of Clan Wars\n' +
        '8-Add User to Clan\n' +
        '9-Add User Duty\n' +
        '10-Add User\n' +
        '11-Add Role\n' +
        '12-Add Building\n' +
        '13-View List of Clans\n'
       )

while True:

    command = raw_input()

    if command == '1':
        add_clan.add_clan(cnxn)  # TODO: Fix slogan problem.
    elif command == '2':
        start_war.start_war(cnxn)
    elif command == '3':
        change_building_type.change_building_type(cnxn)
    elif command == '4':
        change_user_duty.change_user_duty(cnxn)
    elif command == '5':
        set_clan_slogan.set_clan_slogan(cnxn)
    elif command == '6':
        remove_user_from_clan.remove_user_from_clan(cnxn)
    elif command == '7':
        view_clan_wars_list.view_clan_war_list(cnxn)
    elif command == '8':
        add_user_to_clan.add_user_to_clan(cnxn)
    elif command == '9':
        add_user_duty.add_user_duty(cnxn)
    elif command == '10':
        add_user.add_user(cnxn)
    elif command == '11':
        add_role.add_role(cnxn)
    elif command == '12':
        add_building.add_building(cnxn)
    elif command == '13':
        view_list_of_clans.view_list_of_clans(cnxn)
