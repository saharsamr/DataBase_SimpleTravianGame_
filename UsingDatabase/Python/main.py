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
import log_in
import is_loged_in
import log_out


cnxn = connect_to_db.connect_to_db()

while True:
    print (
            'Enter the command number:\n' +
            '1-Add User\n' +
            '2-Add Role\n' +
            '3-Add User Duty\n' +
            '4-Add Building\n' +
            '5-View List Of Clans\n' +
            '6-Log In\n'
    )
    command = raw_input()

    if command == '1':
        add_user.add_user(cnxn)
    elif command == '2':
        add_role.add_role(cnxn)
    elif command == '3':
        add_user_duty.add_user_duty(cnxn)
    elif command == '4':
        add_building.add_building(cnxn)
    elif command == '5':
        view_list_of_clans.view_list_of_clans(cnxn)
    elif command == '6':
        username = log_in.log_in(cnxn)
        print (
                'Enter the command number:\n' +
                '1-Add Clan\n' +
                '2-Start War\n' +
                '3-Add User To Clan\n' +
                '4-Remove User From Clan\n' +
                '5-Set Clan Slogan\n' +
                '6-Change Building Type\n' +
                '7-Change User Duty\n' +
                '8-View Wars OF Clan\n' +
                '9-Log Out\n'
        )
        if is_loged_in.is_loged_in(username, cnxn):
            while True:
                command = raw_input()
                if command == '1':
                    add_clan.add_clan(username, cnxn)
                elif command == '2':
                    start_war.start_war(username, cnxn)
                elif command == '3':
                    add_user_to_clan.add_user_to_clan(username, cnxn)
                elif command == '4':
                    remove_user_from_clan.remove_user_from_clan(username, cnxn)
                elif command == '5':
                    set_clan_slogan.set_clan_slogan(username, cnxn)
                elif command == '6':
                    change_building_type.change_building_type(username, cnxn)
                elif command == '7':
                    change_user_duty.change_user_duty(cnxn)
                elif command == '8':
                    view_clan_wars_list.view_clan_war_list(cnxn)
                elif command == '9':
                    log_out.log_out(cnxn)
                    break
