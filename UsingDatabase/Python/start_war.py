def start_war(cnxn):
    starter = raw_input('Enter starter:')
    threatened = raw_input('Enter treathended:')
    doer = raw_input('Enter doer username:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.StartWar ?, ?, ?'

    cursor.execute(command, (starter, threatened, doer))
    cnxn.commit()

