#include "sdlwrapper.h"
#include "kpongdef.h"

SDL_Surface* screen;
SDL_Window* window;
SDL_Event occur;
SDL_Renderer* renderer;

SDLWrapper::SDLWrapper()
{
}

SDLWrapper::~SDLWrapper()
{
}

void SDLWrapper::initSDL()
{
	SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO); 
	TTF_Init();

}

void SDLWrapper::quitSDL()
{
	TTF_Quit();
	SDL_Quit();
}

void SDLWrapper::createwindow()
{
	window = SDL_CreateWindow("KPong - Simple, Classic Pong",
		SDL_WINDOWPOS_UNDEFINED,
		SDL_WINDOWPOS_UNDEFINED,
		SCREEN_WIDTH,
		SCREEN_HEIGHT,
		SDL_WINDOW_SHOWN);

	renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
}

void SDLWrapper::pollevent()
{
	SDL_PollEvent(&occur);
}

bool SDLWrapper::quitEventCheck()
{
	return (occur.type == SDL_QUIT ? true : false);
}

void SDLWrapper::drawRect(int x, int y, int w, int h)
{
	SDL_Rect rect;
	rect.h = h;
	rect.w = w;
	rect.x = x;
	rect.y = y;


	// Set the render draw colour
	SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);

	// Draw our rectangle
	SDL_RenderFillRect(renderer, &rect);
}

void SDLWrapper::clearScreen()
{
	SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
	SDL_RenderClear(renderer);
	SDL_RenderPresent(renderer);
}

int SDLWrapper::processKeys()
{
	SDL_KeyboardEvent* keybevent = NULL;

	// Check keyboard events
	if (occur.type == SDL_KEYDOWN)
	{
		keybevent = &occur.key;

		return keybevent->keysym.scancode;
	}

	return 0;
}

unsigned int SDLWrapper::getTicks()
{
	return SDL_GetTicks();
}

void SDLWrapper::renderScreen()
{
	// Render
	SDL_RenderPresent(renderer);
}
