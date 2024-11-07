CREATE TABLE questions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    img TEXT,
    question TEXT NOT NULL,
    response TEXT NOT NULL,
    answer BOOLEAN
);
INSERT INTO questions (img, question, response, answer) VALUES
    ('question_1.png', "Ce code est-il dangereux ?", "Non. L'utilisation de fgets permet de stopper le programme si le buffer est dépassé.", FALSE),
    ('question_2.png', "Ce code est-il dangereux ?", "Non. Il n'y a rien de dangereux.", FALSE),
    ('question_3.png', "Ce code est-il dangereux ?", "Oui. Même si on vérifie l'extension, on ne modifie pas le nom, ce qui peut écraser un fichier déjà existant.", TRUE),
    ('question_4.png', "Ce code est-il dangereux ?", "Non. Il n'y a rien de dangereux.", FALSE),
    ('question_5.png', "Ce code est-il dangereux ?", "Oui. Même si la clé d'API est assez robuste, elle est en clair dans le code.", TRUE),
    ('question_6.png', "Ce code est-il dangereux ?", "Non. L'utilisation de htmlspecialchars permet de sécuriser l'entrée utilisateur.", FALSE),
    ('question_7.png', "Ce code est-il dangereux ?", "Non. L'utilisation d'une whitelist stricte permet d'éviter les Local File Inclusions.", FALSE),
    ('question_8.png', "Ce code est-il dangereux ?", "Non. L'utilisation d'une whitelist stricte permet d'éviter une Remote Code Execution.", FALSE),
    ('question_9.png', "Ce code est-il dangereux ?", "Non. L'utilisation de PDO permet de paramétrer la requête SQL et d'éviter les injections.", FALSE),
    ('question_10.png', "Ce code est-il dangereux ?", "Non. L'utilisation d'un token visiblement généré aléatoirement permet d'éviter une faille CSRF.", FALSE);
INSERT INTO questions (img, question, response, answer) VALUES
    ('question_11.png', "Ce code est-il dangereux ?", "Oui. Une RCE est possible, ls / ; whoami", TRUE),
    ('question_12.png', "Ce code est-il dangereux ?", "Oui. La non-utilisation de htmlspecialchars produit une faille XSS.", TRUE),
    ('question_13.png', "Ce code est-il dangereux ?", "Oui. Ce code permet une Local File Inclusion.", TRUE),
    ('question_14.png', "Ce code est-il dangereux ?", "Oui. Il y a une injection SQL.", TRUE),
    ('question_15.png', "Ce code est-il dangereux ?", "Oui. La page web peut être victime d'une attaque CSRF.", TRUE),
    ('question_16.png', "Ce code est-il dangereux ?", "Oui. La clé d'API est trop faible et est encodée en dur dans le code.", TRUE),
    ('question_17.png', "Ce code est-il dangereux ?", "Oui. La fonction eval permet à n'importe qui de manipuler le programme.", TRUE),
    ('question_18.png', "Ce code est-il dangereux ?", "Oui. L'upload de fichier n'est pas sécurisé car l'extension n'est pas vérifiée.", TRUE),
    ('question_19.png', "Ce code est-il dangereux ?", "Oui. Il y a un buffer overflow.", TRUE),
    ('question_20.png', "Ce code est-il dangereux ?", "Oui. On vérifie si .png est dans le nom, mais un attaquant pourrait mettre file.png.php.", TRUE),
    ('question_21.png', "Ce mot de passe est-il sécurisé ?", "Oui. Ce mot de passe est sécurisé. Il respecte tous les critères importants.", TRUE),
    ('question_22.png', "Ce mot de passe est-il sécurisé ?", "Oui. Ce mot de passe est sécurisé. Il respecte tous les critères importants.", TRUE);
INSERT INTO questions (img, question, response, answer) VALUES
    ('question_23.png', "Ce mot de passe est-il sécurisé ?", "Oui. Ce mot de passe est sécurisé. Il respecte tous les critères importants.", TRUE),
    ('question_24.png', "Ce mot de passe est-il sécurisé ?", "Oui. Ce mot de passe est sécurisé. Il respecte tous les critères importants.", TRUE),
    ('question_25.png', "Ce mot de passe est-il sécurisé ?", "Oui. Ce mot de passe est sécurisé. Il respecte tous les critères importants.", TRUE),
    ('question_26.png', "Ce mot de passe est-il sécurisé ?", "Non. Un mot de passe sécurisé doit contenir au moins 12 caractères, combiner des lettres majuscules, minuscules, chiffres, et symboles.", FALSE),
    ('question_27.png', "Ce mot de passe est-il sécurisé ?", "Non. Un mot de passe sécurisé doit contenir au moins 12 caractères, combiner des lettres majuscules, minuscules, chiffres, et symboles.", FALSE),
    ('question_28.png', "Ce mot de passe est-il sécurisé ?", "Non. Un mot de passe sécurisé doit contenir au moins 12 caractères, combiner des lettres majuscules, minuscules, chiffres, et symboles.", FALSE),
    ('question_29.png', "Ce mot de passe est-il sécurisé ?", "Non. Un mot de passe sécurisé doit contenir au moins 12 caractères, combiner des lettres majuscules, minuscules, chiffres, et symboles.", FALSE),
    ('question_30.png', "Ce mot de passe est-il sécurisé ?", "Non. Un mot de passe sécurisé doit contenir au moins 12 caractères, combiner des lettres majuscules, minuscules, chiffres, et symboles.", FALSE),
    ('question_31.png', "Le S dans HTTPS signifie saucisse ?", "Non. Lorsqu'un site commence par 'http' au lieu de 'https', cela signifie que la connexion n'est pas sécurisée. Les données échangées peuvent être interceptées par des tiers, ce qui augmente le risque de vol ou de compromission des informations.", FALSE),
    ('question_32.png', "Utilisez-vous un gestionnaire de mots de passe pour sécuriser vos identifiants ?", "Oui. Les gestionnaires de mots de passe permettent de créer et de stocker des mots de passe uniques et complexes, réduisant ainsi le risque de piratage de comptes.", TRUE);
INSERT INTO questions (img, question, response, answer) VALUES
    ('question_33.png', "Avez-vous activé l'authentification à deux facteurs (2FA) sur vos comptes les plus importants ?", "Oui. La 2FA ajoute une couche supplémentaire de sécurité en demandant une seconde forme de vérification, rendant l'accès plus difficile aux attaquants.", TRUE),
    ('question_34.png', "Est-ce que votre réseau Wi-Fi est protégé par un mot de passe complexe et sécurisé utilisant le protocole WPA3 ?", "Oui. Un mot de passe complexe et un protocole moderne comme WPA3 garantissent une meilleure protection contre les intrusions non autorisées.", TRUE),
    ('question_35.png', "Téléchargez-vous toujours des logiciels à partir de sites officiels ou de sources vérifiées ?", "Oui. Télécharger des logiciels à partir de sources fiables limite le risque de télécharger des programmes infectés par des malwares.", TRUE),
    ('question_36.png', "Vérifiez-vous systématiquement l'adresse e-mail de l'expéditeur avant d'ouvrir une pièce jointe ?", "Oui. Vérifier l'expéditeur permet d'éviter de tomber dans des pièges de phishing qui peuvent installer des logiciels malveillants sur votre appareil.", TRUE),
    ('question_37.png', "Votre antivirus est-il régulièrement mis à jour et programmé pour effectuer des analyses automatiques ?", "Oui. Un antivirus à jour est essentiel pour protéger contre les nouvelles menaces et les virus qui évoluent constamment.", TRUE),
    ('question_38.png', "Appliquez-vous immédiatement les mises à jour de sécurité sur votre système d'exploitation et vos applications ?", "Oui. Les mises à jour corrigent souvent des failles de sécurité, empêchant ainsi les cybercriminels de les exploiter.", TRUE),
    ('question_39.png', "Désactivez-vous le Bluetooth et le Wi-Fi sur votre téléphone lorsque vous ne les utilisez pas ?", "Oui. Laisser le Bluetooth et le Wi-Fi actifs peut permettre aux attaquants de s’y connecter sans autorisation.", TRUE),
    ('question_40.png', "Utilisez-vous un VPN lorsque vous accédez à des réseaux Wi-Fi publics ?", "Oui. Un VPN chiffre votre connexion, protégeant ainsi vos données personnelles et vos activités en ligne sur des réseaux non sécurisés.", TRUE);
INSERT INTO questions (img, question, response, answer) VALUES
    ('question_41.png', "Ce certificat est-il valide ?", "Oui. Les certificats numériques, tels que celui illustré, garantissent que la connexion est sécurisée et que le site est authentique. Un certificat émis par une autorité reconnue et valide est essentiel pour assurer la confidentialité et la sécurité des données échangées.", TRUE),
    ('question_42.png', "Réutilisez-vous le même mot de passe pour plusieurs comptes en ligne ?", "Non. Utiliser le même mot de passe pour plusieurs comptes facilite l'accès aux pirates en cas de compromission d'un seul compte.", FALSE),
    ('question_43.png', "Cliquez-vous sur des liens dans des e-mails provenant d'expéditeurs inconnus sans les vérifier ?", "Non. Les e-mails d'inconnus peuvent contenir des liens de phishing, visant à voler vos informations personnelles ou infecter votre appareil.", FALSE),
    ('question_44.png', "Installez-vous des applications sur votre téléphone sans vérifier les autorisations demandées ?", "Non. Les applications malveillantes peuvent demander des autorisations excessives pour accéder à vos données personnelles.", FALSE),
    ('question_45.png', "Téléchargez-vous des logiciels ou des films à partir de sites de partage non officiels et non sécurisés ?", "Non. Ces sites peuvent contenir des fichiers infectés par des malwares, mettant en danger la sécurité de votre appareil.", FALSE),
    ('question_46.png', "Utilisez-vous des mots de passe simples comme '123456' ou 'motdepasse' ?", "Non. Les mots de passe simples sont faciles à deviner par des attaquants, mettant en péril la sécurité de vos comptes.", FALSE),
    ('question_47.png', "Désactivez-vous votre antivirus parce que vous trouvez qu'il ralentit votre ordinateur ?", "Non. Désactiver l'antivirus expose votre appareil à de potentielles attaques sans protection active.", FALSE),
    ('question_48.png', "Laissez-vous vos appareils connectés à un réseau Wi-Fi public sans protection supplémentaire ?", "Non. Les réseaux publics non sécurisés permettent aux attaquants de s’infiltrer facilement dans vos connexions et de voler des données.", FALSE),
    ('question_49.png', "Utilisez-vous encore une version obsolète de votre navigateur web sans la mettre à jour ?", "Non. Les versions obsolètes de navigateurs contiennent souvent des failles de sécurité qui peuvent être exploitées par des cybercriminels.", FALSE),
    ('question_50.png', "Partagez-vous des informations personnelles telles que votre adresse ou votre numéro de téléphone sur des forums publics ?", "Non. Partager ces informations rend plus facile le ciblage par des personnes malintentionnées ou des arnaqueurs.", FALSE);
