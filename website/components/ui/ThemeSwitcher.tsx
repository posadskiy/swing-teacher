"use client";

import {useTheme} from "@/lib/theme/context";
import {cn} from "@/lib/utils";

export function ThemeSwitcher({className}: { className?: string }) {
    const {theme, toggleTheme} = useTheme();

    return (
        <button
            onClick={toggleTheme}
            className={cn(
                "relative p-2 rounded-lg transition-all duration-300",
                "hover:bg-surface border border-transparent hover:border-border",
                "focus:outline-none focus-visible:ring-2 focus-visible:ring-primary",
                className
            )}
            aria-label={theme === "dark" ? "Switch to light mode" : "Switch to dark mode"}
            title={theme === "dark" ? "Switch to light mode" : "Switch to dark mode"}
        >
            {/* Sun icon for light mode */}
            <svg
                className={cn(
                    "h-5 w-5 transition-all duration-300",
                    theme === "dark"
                        ? "rotate-0 scale-100 text-text-muted"
                        : "rotate-90 scale-0 absolute"
                )}
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
                strokeWidth={2}
            >
                <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"
                />
            </svg>

            {/* Moon icon for dark mode */}
            <svg
                className={cn(
                    "h-5 w-5 transition-all duration-300",
                    theme === "light"
                        ? "rotate-0 scale-100 text-amber-500"
                        : "-rotate-90 scale-0 absolute"
                )}
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
                strokeWidth={2}
            >
                <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"
                />
            </svg>
        </button>
    );
}
