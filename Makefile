all:
	# Download vim-plug
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/.config/nvim
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/vimrc ~/.config/nvim/init.vim
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux ~/.tmux.conf
	[ -f ~/.spotify.scpt ] || ln -s $(PWD)/spotify ~/.spotify.scpt

clean:
	rm -rf ~/.config/base16-shell

	rm -f ~/.zshrc
	rm -f ~/.vimrc
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.tmux.conf
	rm -f ~/.spotify.scpt

.PHONY: all
