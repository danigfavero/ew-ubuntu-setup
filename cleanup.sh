echo 'removing AisleRiot Solitaire'
sudo apt remove aisleriot

echo 'removing Cheese'
sudo apt remove cheese

echo 'removing gnome games:'
echo '1. Mahjongg'
sudo apt remove gnome-mahjongg
echo '2. Mines'
sudo apt remove gnome-mines
echo '3. Sudoku'
sudo apt remove gnome-sudoku

echo 'autoremove'
sudo apt autoremove