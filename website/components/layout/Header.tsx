"use client";

import Link from "next/link";
import {useState} from "react";
import {GITHUB_URL} from "@/lib/constants";
import {Button} from "@/components/ui";
import {LanguageSwitcher} from "@/components/ui/LanguageSwitcher";
import {ThemeSwitcher} from "@/components/ui/ThemeSwitcher";
import {useTranslations} from "@/lib/translations/context";
import {addLocaleToPath} from "@/lib/i18n";
import {cn} from "@/lib/utils";

export function Header() {
    const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
    const {t, locale} = useTranslations();

    return (
        <header className="sticky top-0 z-50 w-full border-b border-border bg-background/80 backdrop-blur-lg transition-all duration-300">
            <nav className="mx-auto flex max-w-7xl items-center justify-between px-4 py-4 sm:px-6 lg:px-8">
                {/* Logo */}
                <Link href="/" className="flex items-center gap-2 group">
                    <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary text-white font-bold text-sm shadow-md">
                        JST
                    </div>
                    <span className="text-lg font-semibold text-text group-hover:text-primary transition-colors">
            {t.common.siteName}
          </span>
                </Link>

                {/* Desktop Navigation */}
                <div className="hidden md:flex items-center gap-1">
                    <Link
                        href={addLocaleToPath("/", locale)}
                        className="px-4 py-2 text-text-muted hover:text-text transition-colors rounded-lg hover:bg-surface"
                    >
                        {t.nav.home}
                    </Link>
                    <Link
                        href={addLocaleToPath("/docs", locale)}
                        className="px-4 py-2 text-text-muted hover:text-text transition-colors rounded-lg hover:bg-surface"
                    >
                        {t.nav.docs}
                    </Link>
                    <Link
                        href={addLocaleToPath("/download", locale)}
                        className="px-4 py-2 text-text-muted hover:text-text transition-colors rounded-lg hover:bg-surface"
                    >
                        {t.nav.download}
                    </Link>
                    <Link
                        href={addLocaleToPath("/support", locale)}
                        className="px-4 py-2 text-text-muted hover:text-text transition-colors rounded-lg hover:bg-surface"
                    >
                        {t.nav.support}
                    </Link>
                </div>

                {/* Desktop CTA */}
                <div className="hidden md:flex items-center gap-2">
                    <ThemeSwitcher/>
                    <LanguageSwitcher/>
                    <Link
                        href={GITHUB_URL}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-text-muted hover:text-text transition-colors p-2"
                        aria-label="GitHub"
                    >
                        <GitHubIcon className="h-5 w-5"/>
                    </Link>
                    <Link href={addLocaleToPath("/download", locale)}>
                        <Button size="sm">{t.common.download}</Button>
                    </Link>
                </div>

                {/* Mobile menu button */}
                <button
                    type="button"
                    className="md:hidden p-2 text-text-muted hover:text-text"
                    onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
                    aria-label="Toggle menu"
                >
                    {mobileMenuOpen ? (
                        <XIcon className="h-6 w-6"/>
                    ) : (
                        <MenuIcon className="h-6 w-6"/>
                    )}
                </button>
            </nav>

            {/* Mobile Navigation */}
            <div
                className={cn(
                    "md:hidden border-t border-border overflow-hidden transition-all duration-300",
                    mobileMenuOpen ? "max-h-96" : "max-h-0"
                )}
            >
                <div className="px-4 py-4 space-y-2">
                    <Link
                        href={addLocaleToPath("/", locale)}
                        className="block px-4 py-2 text-text-muted hover:text-text hover:bg-surface rounded-lg transition-colors"
                        onClick={() => setMobileMenuOpen(false)}
                    >
                        {t.nav.home}
                    </Link>
                    <Link
                        href={addLocaleToPath("/docs", locale)}
                        className="block px-4 py-2 text-text-muted hover:text-text hover:bg-surface rounded-lg transition-colors"
                        onClick={() => setMobileMenuOpen(false)}
                    >
                        {t.nav.docs}
                    </Link>
                    <Link
                        href={addLocaleToPath("/download", locale)}
                        className="block px-4 py-2 text-text-muted hover:text-text hover:bg-surface rounded-lg transition-colors"
                        onClick={() => setMobileMenuOpen(false)}
                    >
                        {t.nav.download}
                    </Link>
                    <Link
                        href={addLocaleToPath("/support", locale)}
                        className="block px-4 py-2 text-text-muted hover:text-text hover:bg-surface rounded-lg transition-colors"
                        onClick={() => setMobileMenuOpen(false)}
                    >
                        {t.nav.support}
                    </Link>
                    <div className="pt-2 border-t border-border space-y-2">
                        <div className="px-4 flex items-center gap-2">
                            <ThemeSwitcher/>
                            <LanguageSwitcher/>
                        </div>
                        <Link href={addLocaleToPath("/download", locale)} onClick={() => setMobileMenuOpen(false)}>
                            <Button className="w-full">{t.common.download}</Button>
                        </Link>
                    </div>
                </div>
            </div>
        </header>
    );
}

function GitHubIcon({className}: { className?: string }) {
    return (
        <svg className={className} fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
            <path
                fillRule="evenodd"
                d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                clipRule="evenodd"
            />
        </svg>
    );
}

function MenuIcon({className}: { className?: string }) {
    return (
        <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M4 6h16M4 12h16M4 18h16"/>
        </svg>
    );
}

function XIcon({className}: { className?: string }) {
    return (
        <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12"/>
        </svg>
    );
}
